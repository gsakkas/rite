open EzyOcamlmodules
open EzyTypingCoreTypes
open EzyConstraints
open EzyUtils.Infix
open EzyUtils

let logger = new Logger.logger "env"

module EzyPredef = struct
  open Ty
  let bool_type label = Constr (label, Predef.path_bool, [])
  let unit_type label = Constr (label, Predef.path_unit, [])
  let int_type label = Constr (label, Predef.path_int, [])
  let char_type label = Constr (label, Predef.path_char, [])
  let exn_type label = Constr (label, Predef.path_exn, [])
  let array_type label ty = Constr (label, Predef.path_array, [ty])
end


type binding = Mono | Poly

type value_desc = {
  val_ty: Ty.t ;
  val_kind: Types.value_kind ;
  val_binding : binding ;
  val_constraints: AtConstrSet.t ;
  val_loc: ExtLocation.t ;
}

type type_kind =
  | Abstract
  | Synonym of Ty.t
  | Variant of Ty.t list StringMap.t
  | Record of (EzyAsttypes.mutable_flag * Ty.t) StringMap.t

type type_decl = {
  type_params: Ty.t list ;
  type_kind: type_kind ;
  type_loc: ExtLocation.t ;
}

type ctor_tag =
  | Ctor_regular of Path.t
  | Ctor_exception of Path.t

let path_of_tag = function
  | Ctor_regular path | Ctor_exception path -> path

type ctor_desc = {
  ctor_result: Ty.t ;
  ctor_args: Ty.t list ;
  ctor_tag: ctor_tag ;
}

type field_desc = {
  fld_result: Ty.t ;
  fld_arg: Ty.t ;
  fld_mutable: EzyAsttypes.mutable_flag ;
  fld_path: Path.t ;
}

type t = {
  values: (Path.t * value_desc) Ident.tbl ;
  types: (Path.t * type_decl) Ident.tbl ;
  modules: (Path.t * t) Ident.tbl ;
  ctors: ctor_desc StringMap.t ;
  fields: field_desc StringMap.t ;
}

let fresh_ctor_desc ?tyvarmap cd = 
  let tyvarmap, result = Ty.fresh_variant ?tyvarmap cd.ctor_result in
  let tyvarmap, args = Ty.fresh_variants ~tyvarmap cd.ctor_args in
  tyvarmap, { ctor_result = result; ctor_args = args; ctor_tag = cd.ctor_tag }

let fresh_field_desc ?tyvarmap fd =
  let tyvarmap, result = Ty.fresh_variant ?tyvarmap fd.fld_result in
  let tyvarmap, arg = Ty.fresh_variant ~tyvarmap fd.fld_arg in
  tyvarmap, { fd with fld_result = result ; fld_arg = arg }

let persistent_structures =
  (Hashtbl.create 17 : (string, Ident.t * t) Hashtbl.t)

let allowed_module_names = ref None
let forbidden_module_names = ref []

let allow_modules l = allowed_module_names := Some l
let forbid_modules l = forbidden_module_names := l

  

let empty = {
  values = Ident.empty ;
  types = Ident.empty ;
  modules = Ident.empty ;
  ctors = StringMap.empty ;
  fields = StringMap.empty ;
}

let import_signature' = (* break recursion *)
  ref ((fun _ _ -> assert false) : Path.t -> Types.signature -> t)

let import_value_desc val_lid vd =
  let tyvarmap, ty = Ty.import true (ExtLocation.Interface val_lid) vd.Types.val_type in
  {
    val_ty = ty ;
    val_kind = vd.Types.val_kind ;
    val_binding = Poly ;
    val_constraints = AtConstrSet.empty ;
    val_loc = ExtLocation.Interface val_lid ;
  }

let store_value id path vd env =
  { env with values = Ident.add id (path, vd) env.values }

let loc_for_path path = ExtLocation.Interface (Path.to_lident path)

let store_type id path td env =
  let ctors_of_kind = function
    | Variant vs -> StringMap.to_list vs
    | _ -> [] in
  let fields_of_kind = function
    | Record fs -> StringMap.to_list fs
    | _ -> [] in
  let path_aux name = function
    | Path.Pident _ ->
        Path.Pident (Ident.create name)
    | Path.Pdot (path', _, _) ->
        Path.Pdot (path', name, 0)
    | _ -> failwith "store_type:add_ctor" in
  let result = Ty.Constr (loc_for_path path, path, td.type_params) in
  let add_ctor ctors (k, tys) =
    let cd = {
      ctor_result = result ;
      ctor_args = tys ;
      ctor_tag = Ctor_regular (path_aux k path) ;
    } in
    StringMap.add k cd ctors in
  let add_field fields (f, (m, ty)) =
    let fd = {
      fld_mutable = m ;
      fld_result = result ;
      fld_arg = ty ;
      fld_path = path_aux f path ;
    } in
    StringMap.add f fd fields in
  { env with
    types = Ident.add id (path, td) env.types ;
    ctors = List.fold_left add_ctor env.ctors (ctors_of_kind td.type_kind) ;
    fields = List.fold_left add_field env.fields (fields_of_kind td.type_kind) }
let store_module id path md env =
  { env with modules = Ident.add id (path, md) env.modules }
let store_exception id path tys env =
  let td = {
    ctor_args = tys ;
    ctor_result = EzyPredef.exn_type (loc_for_path path) ;
    ctor_tag = Ctor_exception path
  } in
  { env with ctors = StringMap.add (Ident.name id) td env.ctors }


let import_type_decl type_lid td =
  let tyvarmap, params = Ty.import_list true (ExtLocation.Interface type_lid) td.Types.type_params in
  let kind =
    match td.Types.type_kind, td.Types.type_manifest with
      | Types.Type_abstract, None ->
          Abstract
      | Types.Type_abstract, Some ty ->
          let tyvarmap, ty' = Ty.import false (ExtLocation.Interface type_lid) ~tyvarmap ty in
          Synonym ty'
      | Types.Type_variant (vs, _), None ->
          let f tyvarmap (k, tys) =
            let tyvarmap, tys' = Ty.import_list false (ExtLocation.Interface type_lid) ~tyvarmap tys in
            tyvarmap, (k, tys') in
          let vs' = snd (List.foldmap f tyvarmap vs) in
          Variant (StringMap.from_list vs')
      | Types.Type_record (fs, _, _), None ->
          let f tyvarmap (f, m, ty) =
            let tyvarmap, ty' = Ty.import false (ExtLocation.Interface type_lid) ~tyvarmap ty in
            tyvarmap, (f, (m, ty')) in
          let fs' = snd (List.foldmap f tyvarmap fs) in
          Record (StringMap.from_list fs')
      | _ -> raise Exit in
  { type_params = params ;
    type_kind = kind ;
    type_loc = ExtLocation.Interface type_lid }

let import_ctor_desc path cd =
  let loc = loc_for_path path in
  let tyvarmap, result = Ty.import false loc cd.Types.cstr_res in
  let tyvarmap, args = Ty.import_list false loc cd.Types.cstr_args in
  {
    ctor_result = result ;
    ctor_args = args ;
    ctor_tag = Ctor_exception path ;
  }

let add_oenv env oenv =

  let add_value env ident =
    let path, vd = Env.lookup_value (Longident.Lident (Ident.name ident)) oenv in
    let vd' = import_value_desc (Path.to_lident path) vd in
    store_value ident path vd' env in

  let add_type env ident =
    let path, td = Env.lookup_type (Longident.Lident (Ident.name ident)) oenv in
    let td' = import_type_decl (Path.to_lident path) td in
    store_type ident path td' env in

  let add_exception env ident =
    let name = Ident.name ident in
    let cd = Env.lookup_constructor (Longident.Lident name) oenv in
    match cd.Types.cstr_tag with
      | Types.Cstr_exception path ->
          let cd' = import_ctor_desc path cd in
          { env with ctors = StringMap.add name cd' env.ctors }
      | _ -> env in

  let env = List.fold_left add_value env (Env.value_domain oenv) in
  let env = List.fold_left add_type env (Env.type_domain oenv) in
  let env = List.fold_left add_exception env (Env.constructor_domain oenv) in
  env

let check_module_validity name =
  let allowed =
    match !allowed_module_names with
      | None -> true
      | Some l -> List.mem name l in
  let forbidden =
    List.mem name !forbidden_module_names in
  if not allowed || forbidden then
    EzyErrors.raise_fatal (EzyErrors.Module_not_found (Longident.Lident name))

let open_module name env = 
  check_module_validity name ;
  let oenv = Env.open_pers_signature name Env.empty in
  Ident.create_persistent name, add_oenv env oenv

let find_pers_struct ident =
  let name = Ident.name ident in
  check_module_validity name ;
  try
    snd (Hashtbl.find persistent_structures name)
  with Not_found ->
    let oenv = Env.open_pers_signature name Env.empty in
    let env = add_oenv empty oenv in
      Hashtbl.add persistent_structures name (ident, env) ;
      env

let lookup_pers_struct name =
  try
    Hashtbl.find persistent_structures name
  with Not_found ->
    let ident = Ident.create name in
    ident, find_pers_struct ident

let find_module path env =
  match path with
    | Path.Pident ident ->
        find_pers_struct ident
    | Path.Pdot _ ->
        not_implemented "EzyEnv.find_module Path.Pdot _"
    | Path.Papply _ ->
        invalid_arg "EzyEnv.find_module"

let lookup_module lid env =
  match lid with
    | Longident.Lident name ->
        let ident, md = lookup_pers_struct name in
        Path.Pident ident, md
    | Longident.Ldot _ ->
        not_implemented "EzyEnv.lookup_module"
    | Longident.Lapply _ ->
        invalid_arg "EzyEnv.lookup_module"
        

let add_value id vd env =
  store_value id (Path.Pident id) vd env
let add_module id md env =
  store_module id (Path.Pident id) md env
let add_type id td env =
  store_type id (Path.Pident id) td env


let enter store_func name data env =
  let id = Ident.create name in
  id, store_func id (Path.Pident id) data env

let enter_value name vd env =
  enter store_value name vd env
let enter_type name td env =
  enter store_type name td env
let enter_exception name tys env =
  enter store_exception name tys env


let find proj path env =
  match path with
    | Path.Pident ident ->
        snd (Ident.find_same ident (proj env))
    | Path.Pdot (path, name, _) ->
        let md = find_module path env in
        snd (Ident.find_name name (proj md))
    | Path.Papply _ ->
        invalid_arg "EzyEnv.find"

let find_value =
  find (fun env -> env.values)
let find_type =
  find (fun env -> env.types)


let lookup proj lid (env:t) =
  match lid with
    | Longident.Lident name ->
        Ident.find_name name (proj env)
    | Longident.Ldot (lid, name) ->
        let path, md_env = lookup_module lid env in
        let _, x = Ident.find_name name (proj md_env) in
        Path.Pdot (path, name, 0), x
    | Longident.Lapply _ ->
        invalid_arg "EzyEnv.lookup"
let lookup proj lid env =
  try lookup proj lid env
  with Not_found as exn ->
    logger#debug "Could not find %a in %a" Longident.print lid (List.print Ident.print ", ") (Ident.keys (proj env));
    raise exn

let lookup_value = lookup (fun env -> env.values)
let lookup_type = lookup (fun env -> env.types)

let lookup_shortcut proj lid env =
  let aux name env =
    StringMap.find name (proj env) in
  match lid with
    | Longident.Lident name ->
        aux name env
    | Longident.Ldot (lid, name) ->
        aux name (snd (lookup_module lid env))
    | Longident.Lapply _ ->
        invalid_arg "EzyEnv.lookup_shortcut"

let lookup_ctor ?tyvarmap lid env =
  fresh_ctor_desc ?tyvarmap (lookup_shortcut (fun env -> env.ctors) lid env)
let lookup_field ?tyvarmap lid env =
  fresh_field_desc ?tyvarmap (lookup_shortcut (fun env -> env.fields) lid env )

let _ = import_signature' := fun path sg ->
  let lid = Path.to_lident path in
  let f env = function
    | Types.Tsig_value (ident, vd) ->
        add_value ident (import_value_desc (Longident.Ldot (lid, Ident.name ident)) vd) env
    | Types.Tsig_type (ident, td, _) ->
        add_type ident (import_type_decl (Longident.Ldot (lid, Ident.name ident)) td) env
    | Types.Tsig_exception (ident, ed) ->
        let tyvarmap, tys = Ty.import_list false (ExtLocation.Interface lid) ed in
        snd (enter_exception (Ident.name ident) tys env)
    | Types.Tsig_module (ident, Types.Tmty_signature sg, _) ->
        let path = Path.Pdot (path, Ident.name ident, Ident.binding_time ident) in
        let sg_env = !import_signature' path sg in
        store_module ident path sg_env env
    | _ -> env in
  List.fold_left f empty sg

let import_signature = !import_signature' 

(** Imports all top level values, types and exceptions of an Env.t.
  *)
let import oenv =

  add_oenv empty oenv

exception Cannot_expand

let find_type_expansion env path =
  assert false
(*
  let td = find_type env path in
  match td.type_kind with
    | Synonym body -> td.type_params, body
    | _ -> raise Not_found
 *)

let expand_abbrev env ty =
  assert false
(*
  match ty.Ty.desc with
    | Ty.Constr (path, args) ->
        let params, body = 
          let td = find_type env path in
          match td.type_kind with
            | Synonym body -> td.type_params, body
            | _ -> raise Cannot_expand in
        let extract_tyvar = function { Ty.desc = Ty.Var tyvar } -> tyvar | _ -> assert false in
        let tyvars = List.map extract_tyvar params in
        let s = TyVarSubst.from_list (List.combin tyvars args) in
        TyVarSubst.apply_to_ty s body
    | Ty.Tuple tys ->
 *)

let expand_constr env label path args k =
  begin try
    let td = find_type path env in
    begin match td.type_kind with
      | Synonym tx ->
          let extract_tyvar = function Ty.Var (_, _, tyvar) -> tyvar | _ -> assert false in
          let tyvars = List.map extract_tyvar td.type_params in
          let s = TyVarSubst.from_list (List.combine tyvars args) in
          k env (TyVarSubst.apply_to_ty s tx)
      | _ ->
          Ty.Constr (label, path, args)
    end
  with Not_found as exn ->
    logger#error "Could not find %s to expand." (Path.name path) ;
    raise exn
  end

let expand_type env = function
  | Ty.Var _ | Ty.Tuple _ | Ty.Arrow _ as ty -> ty
  | Ty.Constr (label, path, args) ->
      expand_constr env label path args (const id)

let rec full_expand_type env = function
  | Ty.Var _ as ty ->
      ty
  | Ty.Tuple (label, tys) ->
      Ty.Tuple (label, List.map (full_expand_type env) tys)
  | Ty.Arrow (label, tx1, tx2) ->
      Ty.Arrow (label, full_expand_type env tx1, full_expand_type env tx2) 
  | Ty.Constr (label, path, args) ->
      expand_constr env label path args full_expand_type

let full_expand_type env ty =
  between $ full_expand_type env $ ty $
    fun ty' ->
      logger#trace "full_expanded_type %a -> %a" Ty.print ty Ty.print ty'

let cyclic_abbrev env ty =
  assert false
(*   let  *)

let print_kind ppf = function
    | Abstract -> Format.pp_print_string ppf "<abstr>"
    | Synonym ty -> Ty.print ppf ty
    | Variant vs ->
        let aux k = function
          | [] -> Format.fprintf ppf "| %s " k
          | tys -> Format.fprintf ppf "| %s of %a " k (List.print Ty.print " * ") tys in
        StringMap.iter aux vs
    | Record fs ->
        let p ppf (m, ty) =
          Format.fprintf ppf "%a%a"
            Printast.fmt_mutable_flag m
            Ty.print ty in
        StringMap.print p ppf fs

let print ?(s=TyVarSubst.empty) everything ppf env =
  let print_value ppf ident =
    let vd = find_value (Path.Pident ident) env in
     match vd.val_loc with (* only print locally defined values *) 
       | ExtLocation.Interface _ when not everything -> () 
       | _ ->
          Format.fprintf ppf "@[%s: %s%a;@]@ "
            (Ident.name ident)
            (match vd.val_binding with Mono -> "MONO " | Poly -> "")
            Ty.print (TyVarSubst.apply_to_ty s vd.val_ty)
  in
  let print_type ppf ident =
    let td = find_type (Path.Pident ident) env in
    match td.type_loc with (* only print locally defined values *) 
      | ExtLocation.Interface _ when not everything -> ()
      | _ ->
          Format.fprintf ppf "@[type (%a) %s = %a;@]@ "
            (List.print Ty.print ", ") td.type_params
            (Ident.name ident)
            print_kind td.type_kind
  in
  Format.fprintf ppf
    "@[Values: %a@]@ @[Types: %a@]@]"(*"@[Ctors:@ %a@]@ @[Fields:@ %a@]"*)
    (List.print print_value "") (Ident.keys env.values)
    (List.print print_type "") (Ident.keys env.types)
(*
    StringMap.KeySet.print (StringMap.keys env.ctors)
    StringMap.KeySet.print (StringMap.keys env.fields)
 *)
(*
  Format.fprintf ppf
    "Values: %a\nTypes: %a\nCtors: %a\nFields: %a"
    (List.print print_value "") (Ident.keys env.values)
    (List.print print_type "") (Ident.keys env.types)
    StringMap.KeySet.print (StringMap.keys env.ctors)
    StringMap.KeySet.print (StringMap.keys env.fields)
 *)

let print_cons ppf everything env =
  let print_type ppf ident =
    let td = find_type (Path.Pident ident) env in
    match td.type_kind with
      | Synonym _ -> (
          let s = Ident.name ident in
          let contains s1 s2 =
            let re = Str.regexp_string s2 in
            try 
              ignore (Str.search_forward re s1 0); 
              true
            with Not_found -> false in 
          if not (contains s "format") then (
                  Format.fprintf ppf "@[%s %a[\"%s\":%a] == %a[\"%s\":%a];[%a]@\n@]"
            (Ident.name ident)
            (List.print Ty.print " ") td.type_params
            (Ident.name ident)
            ExtLocation.print td.type_loc
            print_kind td.type_kind
            (Ident.name ident)
            ExtLocation.print td.type_loc
            ExtLocation.print td.type_loc
          )
        )
      | _ -> ()
  in
  Format.fprintf ppf
    "@[%a@]"(*"@[Ctors:@ %a@]@ @[Fields:@ %a@]"*)
    (List.print print_type "") (Ident.keys env.types)

let print_cons_in_kind ppf env =
  let print_cons_param ppf ident =
    let td = find_type (Path.Pident ident) env in
    match td.type_kind with
      | Variant vs ->
          let aux k = function
            | tys -> (
               let p ty = (
                 match ty with
                 | Ty.Constr (_, _, tlist) ->
                     if List.is_empty(tlist) then Format.fprintf ppf "CONSTRUCTOR %a 0\n" Ty.print ty 
                 | _ -> ()) in
               List.iter p tys
            )
            | [] -> () in
          StringMap.iter aux vs
      | _ -> ()
  
  in
  Format.fprintf ppf
    "@[%a@]"(*"@[Ctors:@ %a@]@ @[Fields:@ %a@]"*)
    (List.print print_cons_param "") (Ident.keys env.types)


let print_constructor ppf everything env =
  let print_type ppf ident =
    let td = find_type (Path.Pident ident) env in
    let print_name ppf tdesc = 
      match tdesc.type_loc with
    | ExtLocation.Interface _ -> Format.fprintf ppf "%a" ExtLocation.print tdesc.type_loc
    | _ -> Format.fprintf ppf "%s" (Ident.name ident) in 
    
    match td.type_kind with
      | Abstract ->
        Format.fprintf ppf "@[CONSTRUCTOR %a %i\n@]"
          print_name td
          (List.length td.type_params)

      | Variant vs ->
        Format.fprintf ppf "@[CONSTRUCTOR %a %i\n@]"
          print_name td
          (List.length td.type_params)

      | Record fs ->
        Format.fprintf ppf "@[CONSTRUCTOR %a %i\n@]"
          print_name td
          (List.length td.type_params)
      | _ -> ()
  in
  Format.fprintf ppf
    "@[%a@]"(*"@[Ctors:@ %a@]@ @[Fields:@ %a@]"*)
    (List.print print_type "") (Ident.keys env.types)

let _ =
  forbid_modules ["Format"; "Printf"; "Scanf"] ;
