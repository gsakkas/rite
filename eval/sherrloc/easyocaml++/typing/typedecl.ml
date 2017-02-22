(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(* Xavier Leroy and Jerome Vouillon, projet Cristal, INRIA Rocquencourt*)
(*                                                                     *)
(*  Copyright 1996 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: typedecl.ml,v 1.76.6.2 2007/03/12 13:14:26 garrigue Exp $ *)

(**** Typing of type definitions ****)

open Misc
open Asttypes
open Parsetree
open Primitive
open Types
open Typedtree
open Typetexp

type error =
    Repeated_parameter
  | Duplicate_constructor of string
  | Too_many_constructors
  | Duplicate_label of string
  | Recursive_abbrev of string
  | Definition_mismatch of type_expr
  | Constraint_failed of type_expr * type_expr
  | Unconsistent_constraint of (type_expr * type_expr) list
  | Type_clash of (type_expr * type_expr) list
  | Parameters_differ of Path.t * type_expr * type_expr
  | Null_arity_external
  | Missing_native_external
  | Unbound_type_var of type_expr * type_declaration
  | Unbound_exception of Longident.t
  | Not_an_exception of Longident.t
  | Bad_variance of int * (bool*bool) * (bool*bool)
  | Unavailable_type_constructor of Path.t
  | Bad_fixed_type of string

exception Error of Location.t * error

(* Enter all declared types in the environment as abstract types *)

let enter_type env (name, sdecl) id =
  let decl =
    { type_params =
        List.map (fun _ -> Btype.newgenvar ()) sdecl.ptype_params;
      type_arity = List.length sdecl.ptype_params;
      type_kind = Type_abstract;
      type_manifest =
        begin match sdecl.ptype_manifest with None -> None
        | Some _ -> Some(Ctype.newvar ()) end;
      type_variance = List.map (fun _ -> true, true, true) sdecl.ptype_params;
    }
  in
  Env.add_type id decl env

let update_type temp_env env id loc =
  let path = Path.Pident id in
  let decl = Env.find_type path temp_env in
  match decl.type_manifest with None -> ()
  | Some ty ->
      let params = List.map (fun _ -> Ctype.newvar ()) decl.type_params in
      try Ctype.unify env (Ctype.newconstr path params) ty
      with Ctype.Unify trace ->
        raise (Error(loc, Type_clash trace))

(* Determine if a type is (an abbreviation for) the type "float" *)

let is_float env ty =
  match Ctype.repr (Ctype.expand_head env ty) with
    {desc = Tconstr(p, _, _)} -> Path.same p Predef.path_float
  | _ -> false

(* Set the row variable in a fixed type *)
let set_fixed_row env loc p decl =
  let tm =
    match decl.type_manifest with
      None -> assert false
    | Some t -> Ctype.expand_head env t
  in
  let rv =
    match tm.desc with
      Tvariant row ->
        let row = Btype.row_repr row in
        tm.desc <- Tvariant {row with row_fixed = true};
        if Btype.static_row row then Btype.newgenty Tnil
        else row.row_more
    | Tobject (ty, _) ->
        snd (Ctype.flatten_fields ty)
    | _ ->
        raise (Error (loc, Bad_fixed_type "is not an object or variant"))
  in
  if rv.desc <> Tvar then
    raise (Error (loc, Bad_fixed_type "has no row variable"));
  rv.desc <- Tconstr (p, decl.type_params, ref Mnil)

(* Translate one type declaration *)

module StringSet =
  Set.Make(struct
    type t = string
    let compare = compare
  end)

let transl_declaration env (name, sdecl) id =
  (* Bind type parameters *)
  reset_type_variables();
  Ctype.begin_def ();
  let params =
    try List.map (enter_type_variable true sdecl.ptype_loc) sdecl.ptype_params
    with Already_bound ->
      raise(Error(sdecl.ptype_loc, Repeated_parameter))
  in
  let cstrs = List.map
      (fun (sty, sty', loc) ->
        transl_simple_type env false sty,
        transl_simple_type env false sty', loc)
      sdecl.ptype_cstrs
  in
  let decl =
    { type_params = params;
      type_arity = List.length params;
      type_kind =
        begin match sdecl.ptype_kind with
          Ptype_abstract | Ptype_private ->
            Type_abstract
        | Ptype_variant (cstrs, priv) ->
            let all_constrs = ref StringSet.empty in
            List.iter
              (fun (name, args, loc) ->
                if StringSet.mem name !all_constrs then
                  raise(Error(sdecl.ptype_loc, Duplicate_constructor name));
                all_constrs := StringSet.add name !all_constrs)
              cstrs;
            if List.length (List.filter (fun (_, args, _) -> args <> []) cstrs)
               > (Config.max_tag + 1) then
              raise(Error(sdecl.ptype_loc, Too_many_constructors));
            Type_variant(List.map
              (fun (name, args, loc) ->
                      (name, List.map (transl_simple_type env true) args))
              cstrs, priv)
        | Ptype_record (lbls, priv) ->
            let all_labels = ref StringSet.empty in
            List.iter
              (fun (name, mut, arg, loc) ->
                if StringSet.mem name !all_labels then
                  raise(Error(sdecl.ptype_loc, Duplicate_label name));
                all_labels := StringSet.add name !all_labels)
              lbls;
            let lbls' =
              List.map
                (fun (name, mut, arg, loc) ->
                  let ty = transl_simple_type env true arg in
                  name, mut, match ty.desc with Tpoly(t,[]) -> t | _ -> ty)
                lbls in
            let rep =
              if List.for_all (fun (name, mut, arg) -> is_float env arg) lbls'
              then Record_float
              else Record_regular in
            Type_record(lbls', rep, priv)
        end;
      type_manifest =
        begin match sdecl.ptype_manifest with
          None -> None
        | Some sty ->
            let ty =
              transl_simple_type env (sdecl.ptype_kind <> Ptype_private) sty in
            if Ctype.cyclic_abbrev env id ty then
              raise(Error(sdecl.ptype_loc, Recursive_abbrev name));
            Some ty
        end;
      type_variance = List.map (fun _ -> true, true, true) params;
    } in

  (* Check constraints *)
  List.iter
    (fun (ty, ty', loc) ->
      try Ctype.unify env ty ty' with Ctype.Unify tr ->
        raise(Error(loc, Unconsistent_constraint tr)))
    cstrs;
  Ctype.end_def ();
  if sdecl.ptype_kind = Ptype_private then begin
    let (p, _) =
      try Env.lookup_type (Longident.Lident(Ident.name id ^ "#row")) env
      with Not_found -> assert false in
    set_fixed_row env sdecl.ptype_loc p decl
  end;
  (id, decl)

(* Generalize a type declaration *)

let generalize_decl decl =
  List.iter Ctype.generalize decl.type_params;
  begin match decl.type_kind with
    Type_abstract ->
      ()
  | Type_variant (v, priv) ->
      List.iter (fun (_, tyl) -> List.iter Ctype.generalize tyl) v
  | Type_record(r, rep, priv) ->
      List.iter (fun (_, _, ty) -> Ctype.generalize ty) r
  end;
  begin match decl.type_manifest with
  | None    -> ()
  | Some ty -> Ctype.generalize ty
  end

(* Check that all constraints are enforced *)

module TypeSet =
  Set.Make
    (struct
      type t = type_expr
      let compare t1 t2 = t1.id - t2.id
    end)

let rec check_constraints_rec env loc visited ty =
  let ty = Ctype.repr ty in
  if TypeSet.mem ty !visited then () else begin
  visited := TypeSet.add ty !visited;
  match ty.desc with
  | Tconstr (path, args, _) ->
      let args' = List.map (fun _ -> Ctype.newvar ()) args in
      let ty' = Ctype.newconstr path args' in
      begin try Ctype.enforce_constraints env ty'
      with Ctype.Unify _ -> assert false
      | Not_found -> raise (Error(loc, Unavailable_type_constructor path))
      end;
      if not (Ctype.matches env ty ty') then
        raise (Error(loc, Constraint_failed (ty, ty')));
      List.iter (check_constraints_rec env loc visited) args
  | Tpoly (ty, tl) ->
      let _, ty = Ctype.instance_poly false tl ty in
      check_constraints_rec env loc visited ty
  | _ ->
      Btype.iter_type_expr (check_constraints_rec env loc visited) ty
  end

let check_constraints env (_, sdecl) (_, decl) =
  let visited = ref TypeSet.empty in
  begin match decl.type_kind with
  | Type_abstract -> ()
  | Type_variant (l, _) ->
      let rec find_pl = function
          Ptype_variant(pl, _) -> pl
        | Ptype_record _ | Ptype_abstract | Ptype_private -> assert false
      in
      let pl = find_pl sdecl.ptype_kind in
      List.iter
        (fun (name, tyl) ->
          let styl =
            try let (_,sty,_) = List.find (fun (n,_,_) -> n = name) pl in sty
            with Not_found -> assert false in
          List.iter2
            (fun sty ty ->
              check_constraints_rec env sty.ptyp_loc visited ty)
            styl tyl)
        l
  | Type_record (l, _, _) ->
      let rec find_pl = function
          Ptype_record(pl, _) -> pl
        | Ptype_variant _ | Ptype_abstract | Ptype_private -> assert false
      in
      let pl = find_pl sdecl.ptype_kind in
      let rec get_loc name = function
          [] -> assert false
        | (name', _, sty, _) :: tl ->
            if name = name' then sty.ptyp_loc else get_loc name tl
      in
      List.iter
        (fun (name, _, ty) ->
          check_constraints_rec env (get_loc name pl) visited ty)
        l
  end;
  begin match decl.type_manifest with
  | None -> ()
  | Some ty ->
      let sty =
        match sdecl.ptype_manifest with Some sty -> sty | _ -> assert false
      in
      check_constraints_rec env sty.ptyp_loc visited ty
  end

(*
   If both a variant/record definition and a type equation are given,
   need to check that the equation refers to a type of the same kind
   with the same constructors and labels.
*)
let check_abbrev env (_, sdecl) (id, decl) =
  match decl with
    {type_kind = (Type_variant _ | Type_record _); type_manifest = Some ty} ->
      begin match (Ctype.repr ty).desc with
        Tconstr(path, args, _) ->
          begin try
            let decl' = Env.find_type path env in
            if List.length args = List.length decl.type_params
            && Ctype.equal env false args decl.type_params
            && Includecore.type_declarations env id
                decl'
                (Subst.type_declaration (Subst.add_type id path Subst.identity)
                                        decl)
            then ()
            else raise(Error(sdecl.ptype_loc, Definition_mismatch ty))
          with Not_found ->
            raise(Error(sdecl.ptype_loc, Unavailable_type_constructor path))
          end
      | _ -> raise(Error(sdecl.ptype_loc, Definition_mismatch ty))
      end
  | _ -> ()

(* Check for ill-defined abbrevs *)

let check_recursion env loc path decl to_check =
  (* to_check is true for potentially mutually recursive paths.
     (path, decl) is the type declaration to be checked. *)

  let visited = ref [] in

  let rec check_regular cpath args prev_exp ty =
    let ty = Ctype.repr ty in
    if not (List.memq ty !visited) then begin
      visited := ty :: !visited;
      match ty.desc with
      | Tconstr(path', args', _) ->
          if Path.same path path' then begin
            if not (Ctype.equal env false args args') then
              raise (Error(loc,
                     Parameters_differ(cpath, ty, Ctype.newconstr path args)))
          end
          (* Attempt to expand a type abbreviation if:
              1- [to_check path'] holds
                 (otherwise the expansion cannot involve [path]);
              2- we haven't expanded this type constructor before
                 (otherwise we could loop if [path'] is itself
                 a non-regular abbreviation). *)
          else if to_check path' && not (List.mem path' prev_exp) then begin
            try
              (* Attempt expansion *)
              let (params0, body0) = Env.find_type_expansion path' env in
              let (params, body) =
                Ctype.instance_parameterized_type params0 body0 in
              begin
                try List.iter2 (Ctype.unify env) params args'
                with Ctype.Unify _ ->
                  raise (Error(loc, Constraint_failed
                                 (ty, Ctype.newconstr path' params0)));
              end;
              check_regular path' args (path' :: prev_exp) body
            with Not_found -> ()
          end;
          List.iter (check_regular cpath args prev_exp) args'
      | Tpoly (ty, tl) ->
          let (_, ty) = Ctype.instance_poly false tl ty in
          check_regular cpath args prev_exp ty
      | _ ->
          Btype.iter_type_expr (check_regular cpath args prev_exp) ty
    end in

  match decl.type_manifest with
  | None -> ()
  | Some body ->
      (* Check that recursion is well-founded *)
      begin try
        Ctype.correct_abbrev env path decl.type_params body
      with Ctype.Recursive_abbrev ->
        raise(Error(loc, Recursive_abbrev (Path.name path)))
      | Ctype.Unify trace -> raise(Error(loc, Type_clash trace))
      end;
      (* Check that recursion is regular *)
      if decl.type_params = [] then () else
      let (args, body) =
        Ctype.instance_parameterized_type decl.type_params body in
      check_regular path args [] body

let check_abbrev_recursion env id_loc_list (id, decl) =
  check_recursion env (List.assoc id id_loc_list) (Path.Pident id) decl
    (function Path.Pident id -> List.mem_assoc id id_loc_list | _ -> false)

(* Compute variance *)

let compute_variance env tvl nega posi cntr ty =
  let pvisited = ref TypeSet.empty
  and nvisited = ref TypeSet.empty
  and cvisited = ref TypeSet.empty in
  let rec compute_variance_rec posi nega cntr ty =
    let ty = Ctype.repr ty in
    if (not posi || TypeSet.mem ty !pvisited)
    && (not nega || TypeSet.mem ty !nvisited)
    && (not cntr || TypeSet.mem ty !cvisited) then
      ()
    else begin
      if posi then pvisited := TypeSet.add ty !pvisited;
      if nega then nvisited := TypeSet.add ty !nvisited;
      if cntr then cvisited := TypeSet.add ty !cvisited;
      let compute_same = compute_variance_rec posi nega cntr in
      match ty.desc with
        Tarrow (_, ty1, ty2, _) ->
          compute_variance_rec nega posi true ty1;
          compute_same ty2
      | Ttuple tl ->
          List.iter compute_same tl
      | Tconstr (path, tl, _) ->
          if tl = [] then () else begin
            try
              let decl = Env.find_type path env in
              List.iter2
                (fun ty (co,cn,ct) ->
                  compute_variance_rec
                    (posi && co || nega && cn)
                    (posi && cn || nega && co)
                    (cntr || ct)
                    ty)
                tl decl.type_variance
            with Not_found ->
              List.iter (compute_variance_rec true true true) tl
          end
      | Tobject (ty, _) ->
          compute_same ty
      | Tfield (_, _, ty1, ty2) ->
          compute_same ty1;
          compute_same ty2
      | Tsubst ty ->
          compute_same ty
      | Tvariant row ->
          let row = Btype.row_repr row in
          List.iter
            (fun (_,f) ->
              match Btype.row_field_repr f with
                Rpresent (Some ty) ->
                  compute_same ty
              | Reither (_, tyl, _, _) ->
                  List.iter compute_same tyl
              | _ -> ())
            row.row_fields;
          compute_same row.row_more
      | Tpoly (ty, _) ->
          compute_same ty
      | Tvar | Tnil | Tlink _ | Tunivar -> ()
    end
  in
  compute_variance_rec nega posi cntr ty;
  List.iter
    (fun (ty, covar, convar, ctvar) ->
      if TypeSet.mem ty !pvisited then covar := true;
      if TypeSet.mem ty !nvisited then convar := true;
      if TypeSet.mem ty !cvisited then ctvar := true)
    tvl

let make_variance ty = (ty, ref false, ref false, ref false)
let whole_type decl =
  match decl.type_kind with
    Type_variant (tll,_) ->
      Btype.newgenty
        (Ttuple (List.map (fun (_, tl) -> Btype.newgenty (Ttuple tl)) tll))
  | Type_record (ftl, _, _) ->
      Btype.newgenty
        (Ttuple (List.map (fun (_, _, ty) -> ty) ftl))
  | Type_abstract ->
      match decl.type_manifest with
        Some ty -> ty
      | _ -> Btype.newgenty (Ttuple [])

let compute_variance_decl env check decl (required, loc) =
  if decl.type_kind = Type_abstract && decl.type_manifest = None then
    List.map (fun (c, n) -> if c || n then (c, n, n) else (true, true, true))
      required
  else
  let params = List.map Btype.repr decl.type_params in
  let tvl0 = List.map make_variance params in
  let fvl = if check then Ctype.free_variables (whole_type decl) else [] in
  let fvl = List.filter (fun v -> not (List.memq v params)) fvl in
  let tvl1 = List.map make_variance fvl in
  let tvl2 = List.map make_variance fvl in
  let tvl = tvl0 @ tvl1 in
  begin match decl.type_kind with
    Type_abstract ->
      begin match decl.type_manifest with
        None -> assert false
      | Some ty -> compute_variance env tvl true false false ty
      end
  | Type_variant (tll, _) ->
      List.iter
        (fun (_,tl) ->
          List.iter (compute_variance env tvl true false false) tl)
        tll
  | Type_record (ftl, _, _) ->
      List.iter
        (fun (_, mut, ty) ->
          let cn = (mut = Mutable) in
          compute_variance env tvl true cn cn ty)
        ftl
  end;
  let priv =
    match decl.type_kind with
      Type_abstract ->
        begin match decl.type_manifest with
          Some ty when not (Btype.has_constr_row ty) -> Public
        | _ -> Private
        end
    | Type_variant (_, priv) | Type_record (_, _, priv) -> priv
  and required =
    List.map (fun (c,n as r) -> if c || n then r else (true,true))
      required
  in
  List.iter2
    (fun (ty, co, cn, ct) (c, n) ->
      if ty.desc <> Tvar || priv = Private then begin
        co := c; cn := n; ct := n;
        compute_variance env tvl2 c n n ty
      end)
    tvl0 required;
  List.iter2
    (fun (ty, c1, n1, t1) (_, c2, n2, t2) ->
      if !c1 && not !c2 || !n1 && not !n2
      (* || !t1 && not !t2 && decl.type_kind = Type_abstract *)
      then raise (Error(loc,
                        if not (!c2 || !n2) then Unbound_type_var (ty, decl)
                        else Bad_variance (0, (!c1,!n1), (!c2,!n2)))))
    tvl1 tvl2;
  let pos = ref 0 in
  List.map2
    (fun (_, co, cn, ct) (c, n) ->
      incr pos;
      if !co && not c || !cn && not n
      then raise (Error(loc, Bad_variance (!pos, (!co,!cn), (c,n))));
      let ct = if decl.type_kind = Type_abstract then ct else cn in
      (!co, !cn, !ct))
    tvl0 required

let is_sharp id =
  let s = Ident.name id in
  String.length s > 0 && s.[0] = '#'

let rec compute_variance_fixpoint env decls required variances =
  let new_decls =
    List.map2
      (fun (id, decl) variance -> id, {decl with type_variance = variance})
      decls variances
  in
  let new_env =
    List.fold_right (fun (id, decl) env -> Env.add_type id decl env)
      new_decls env
  in
  let new_variances =
    List.map2
      (fun (id, decl) -> compute_variance_decl new_env false decl)
      new_decls required
  in
  let new_variances =
    List.map2
      (List.map2 (fun (c1,n1,t1) (c2,n2,t2) -> c1||c2, n1||n2, t1||t2))
      new_variances variances in
  if new_variances <> variances then
    compute_variance_fixpoint env decls required new_variances
  else begin
    List.iter2
      (fun (id, decl) req -> if not (is_sharp id) then
        ignore (compute_variance_decl new_env true decl req))
      new_decls required;
    new_decls, new_env
  end

let init_variance (id, decl) =
  List.map (fun _ -> (false, false, false)) decl.type_params

(* for typeclass.ml *)
let compute_variance_decls env cldecls =
  let decls, required =
    List.fold_right
      (fun (obj_id, obj_abbr, cl_abbr, clty, cltydef, required) (decls, req) ->
        (obj_id, obj_abbr) :: decls, required :: req)
      cldecls ([],[])
  in
  let variances = List.map init_variance decls in
  let (decls, _) = compute_variance_fixpoint env decls required variances in
  List.map2
    (fun (_,decl) (_, _, cl_abbr, clty, cltydef, _) ->
      let variance = List.map (fun (c,n,t) -> (c,n)) decl.type_variance in
      (decl, {cl_abbr with type_variance = decl.type_variance},
       {clty with cty_variance = variance},
       {cltydef with clty_variance = variance}))
    decls cldecls

(* Force recursion to go through id for private types*)
let name_recursion sdecl id decl =
  match decl with
    { type_kind = Type_abstract; type_manifest = Some ty }
    when sdecl.ptype_kind = Ptype_private ->
      let ty = Ctype.repr ty in
      let ty' = Btype.newty2 ty.level ty.desc in
      if Ctype.deep_occur ty ty' then
        let td = Tconstr(Path.Pident id, decl.type_params, ref Mnil) in
        Btype.link_type ty (Btype.newty2 ty.level td);
        {decl with type_manifest = Some ty'}
      else decl
  | _ -> decl

(* Translate a set of mutually recursive type declarations *)
let transl_type_decl env name_sdecl_list =
  (* Add dummy types for fixed rows *)
  let fixed_types =
    List.filter (fun (_,sd) -> sd.ptype_kind = Ptype_private) name_sdecl_list
  in
  let name_sdecl_list =
    List.map
      (fun (name,sdecl) ->
        name^"#row",
        {sdecl with ptype_kind = Ptype_abstract; ptype_manifest = None})
      fixed_types
    @ name_sdecl_list
  in
  (* Create identifiers. *)
  let id_list =
    List.map (fun (name, _) -> Ident.create name) name_sdecl_list
  in
  (*
     Since we've introduced fresh idents, make sure the definition
     level is at least the binding time of these events. Otherwise,
     passing one of the recursively-defined type constrs as argument
     to an abbreviation may fail.
  *)
  Ctype.init_def(Ident.current_time());
  Ctype.begin_def();
  (* Enter types. *)
  let temp_env = List.fold_left2 enter_type env name_sdecl_list id_list in
  (* Translate each declaration. *)
  let decls =
    List.map2 (transl_declaration temp_env) name_sdecl_list id_list in
  (* Build the final env. *)
  let newenv =
    List.fold_right
      (fun (id, decl) env -> Env.add_type id decl env)
      decls env
  in
  (* Update stubs *)
  List.iter2
    (fun id (_, sdecl) -> update_type temp_env newenv id sdecl.ptype_loc)
    id_list name_sdecl_list;
  (* Generalize type declarations. *)
  Ctype.end_def();
  List.iter (fun (_, decl) -> generalize_decl decl) decls;
  (* Check for ill-formed abbrevs *)
  let id_loc_list =
    List.map2 (fun id (_,sdecl) -> (id, sdecl.ptype_loc))
      id_list name_sdecl_list
  in
  List.iter (check_abbrev_recursion newenv id_loc_list) decls;
  (* Check that all type variable are closed *)
  List.iter2
    (fun (_, sdecl) (id, decl) ->
       match Ctype.closed_type_decl decl with
         Some ty -> raise(Error(sdecl.ptype_loc, Unbound_type_var(ty,decl)))
       | None   -> ())
    name_sdecl_list decls;
  (* Check re-exportation *)
  List.iter2 (check_abbrev newenv) name_sdecl_list decls;
  (* Check that constraints are enforced *)
  List.iter2 (check_constraints newenv) name_sdecl_list decls;
  (* Name recursion *)
  let decls =
    List.map2 (fun (_, sdecl) (id, decl) -> id, name_recursion sdecl id decl)
      name_sdecl_list decls
  in
  (* Add variances to the environment *)
  let required =
    List.map (fun (_, sdecl) -> sdecl.ptype_variance, sdecl.ptype_loc)
      name_sdecl_list
  in
  let final_decls, final_env =
    compute_variance_fixpoint env decls required (List.map init_variance decls)
  in
  (* Done *)
  (final_decls, final_env)

(* Translate an exception declaration *)
let transl_exception env excdecl =
  reset_type_variables();
  Ctype.begin_def();
  let types = List.map (transl_simple_type env true) excdecl in
  Ctype.end_def();
  List.iter Ctype.generalize types;
  types

(* Translate an exception rebinding *)
let transl_exn_rebind env loc lid =
  let cdescr =
    try
      Env.lookup_constructor lid env
    with Not_found ->
      raise(Error(loc, Unbound_exception lid)) in
  match cdescr.cstr_tag with
    Cstr_exception path -> (path, cdescr.cstr_args)
  | _ -> raise(Error(loc, Not_an_exception lid))

(* Translate a value declaration *)
let transl_value_decl env valdecl =
  let ty = Typetexp.transl_type_scheme env valdecl.pval_type in
  match valdecl.pval_prim with
    [] ->
      { val_type = ty; val_kind = Val_reg }
  | decl ->
      let arity = Ctype.arity ty in
      if arity = 0 then
        raise(Error(valdecl.pval_type.ptyp_loc, Null_arity_external));
      let prim = Primitive.parse_declaration arity decl in
      if !Clflags.native_code
      && prim.prim_arity > 5
      && prim.prim_native_name = ""
      then raise(Error(valdecl.pval_type.ptyp_loc, Missing_native_external));
      { val_type = ty; val_kind = Val_prim prim }

(* Translate a "with" constraint -- much simplified version of
    transl_type_decl. *)
let transl_with_constraint env id row_path sdecl =
  reset_type_variables();
  Ctype.begin_def();
  let params =
    try
      List.map (enter_type_variable true sdecl.ptype_loc) sdecl.ptype_params
    with Already_bound ->
      raise(Error(sdecl.ptype_loc, Repeated_parameter)) in
  List.iter
    (function (ty, ty', loc) ->
       try
         Ctype.unify env (transl_simple_type env false ty)
                         (transl_simple_type env false ty')
       with Ctype.Unify tr ->
         raise(Error(loc, Unconsistent_constraint tr)))
    sdecl.ptype_cstrs;
  let no_row = sdecl.ptype_kind <> Ptype_private in
  let decl =
    { type_params = params;
      type_arity = List.length params;
      type_kind = Type_abstract;
      type_manifest =
        begin match sdecl.ptype_manifest with
          None -> None
        | Some sty ->
            Some(transl_simple_type env no_row sty)
        end;
      type_variance = [];
    }
  in
  begin match row_path with None -> ()
  | Some p -> set_fixed_row env sdecl.ptype_loc p decl
  end;
  begin match Ctype.closed_type_decl decl with None -> ()
  | Some ty -> raise(Error(sdecl.ptype_loc, Unbound_type_var(ty,decl)))
  end;
  let decl = name_recursion sdecl id decl in
  let decl =
    {decl with type_variance =
     compute_variance_decl env false decl
       (sdecl.ptype_variance, sdecl.ptype_loc)} in
  Ctype.end_def();
  generalize_decl decl;
  decl

(* Approximate a type declaration: just make all types abstract *)

let abstract_type_decl arity =
  let rec make_params n =
    if n <= 0 then [] else Ctype.newvar() :: make_params (n-1) in
  Ctype.begin_def();
  let decl =
    { type_params = make_params arity;
      type_arity = arity;
      type_kind = Type_abstract;
      type_manifest = None;
      type_variance = replicate_list (true, true, true) arity } in
  Ctype.end_def();
  generalize_decl decl;
  decl

let approx_type_decl env name_sdecl_list =
  List.map
    (fun (name, sdecl) ->
      (Ident.create name,
       abstract_type_decl (List.length sdecl.ptype_params)))
    name_sdecl_list

(* Variant of check_abbrev_recursion to check the well-formedness
   conditions on type abbreviations defined within recursive modules. *)

let check_recmod_typedecl env loc recmod_ids path decl =
  (* recmod_ids is the list of recursively-defined module idents.
     (path, decl) is the type declaration to be checked. *)
  check_recursion env loc path decl
    (fun path -> List.mem (Path.head path) recmod_ids)


(**** Error report ****)

open Format

let report_error ppf = function
  | Repeated_parameter ->
      fprintf ppf "A type parameter occurs several times"
  | Duplicate_constructor s ->
      fprintf ppf "Two constructors are named %s" s
  | Too_many_constructors ->
      fprintf ppf "Too many non-constant constructors -- \
                   maximum is %i non-constant constructors"
        (Config.max_tag + 1)
  | Duplicate_label s ->
      fprintf ppf "Two labels are named %s" s
  | Recursive_abbrev s ->
      fprintf ppf "The type abbreviation %s is cyclic" s
  | Definition_mismatch ty ->
      Printtyp.reset_and_mark_loops ty;
      fprintf ppf
        "The variant or record definition does not match that of type@ %a"
        Printtyp.type_expr ty
  | Constraint_failed (ty, ty') ->
      fprintf ppf "Constraints are not satisfied in this type.@.";
      Printtyp.reset_and_mark_loops ty;
      Printtyp.mark_loops ty';
      fprintf ppf "@[<hv>Type@ %a@ should be an instance of@ %a@]"
        Printtyp.type_expr ty Printtyp.type_expr ty'
  | Parameters_differ (path, ty, ty') ->
      Printtyp.reset_and_mark_loops ty;
      Printtyp.mark_loops ty';
      fprintf ppf
        "@[<hv>In the definition of %s, type@ %a@ should be@ %a@]"
        (Path.name path) Printtyp.type_expr ty Printtyp.type_expr ty'
  | Unconsistent_constraint trace ->
      fprintf ppf "The type constraints are not consistent.@.";
      Printtyp.report_unification_error ppf trace
        (fun ppf -> fprintf ppf "Type")
        (fun ppf -> fprintf ppf "is not compatible with type")
  | Type_clash trace ->
      Printtyp.report_unification_error ppf trace
        (function ppf ->
           fprintf ppf "This type constructor expands to type")
        (function ppf ->
           fprintf ppf "but is here used with type")
  | Null_arity_external ->
      fprintf ppf "External identifiers must be functions"
  | Missing_native_external ->
      fprintf ppf "@[<hv>An external function with more than 5 arguments \
                   requires second stub function@ \
                   for native-code compilation@]"
  | Unbound_type_var (ty, decl) ->
      fprintf ppf "A type variable is unbound in this type declaration";
      let ty = Ctype.repr ty in
      let explain tl typ kwd lab =
        let ti = List.find (fun ti -> Ctype.deep_occur ty (typ ti)) tl in
        let ty0 = (* Hack to force aliasing when needed *)
          Btype.newgenty (Tobject(ty, ref None)) in
        Printtyp.reset_and_mark_loops_list [typ ti; ty0];
        fprintf ppf
          ".@.@[<hov2>In %s@ %s%a@;<1 -2>the variable %a is unbound@]"
          kwd (lab ti) Printtyp.type_expr (typ ti) Printtyp.type_expr ty
      in
      begin try match decl.type_kind, decl.type_manifest with
        Type_variant (tl, _), _ ->
          explain tl (fun (_,tl) -> Btype.newgenty (Ttuple tl))
            "case" (fun (lab,_) -> lab ^ " of ")
      | Type_record (tl, _, _), _ ->
          explain tl (fun (_,_,t) -> t)
            "field" (fun (lab,_,_) -> lab ^ ": ")
      | Type_abstract, Some ty' ->
          let trivial ty =
            explain [ty] (fun t -> t) "definition" (fun _ -> "") in
          begin match (Ctype.repr ty').desc with
            Tobject(fi,_) ->
              let (tl, rv) = Ctype.flatten_fields fi in
              if rv == ty then trivial ty' else
              explain tl (fun (_,_,t) -> t)
                "method" (fun (lab,_,_) -> lab ^ ": ")
          | Tvariant row ->
              let row = Btype.row_repr row in
              if row.row_more == ty then trivial ty' else
              explain row.row_fields
                (fun (l,f) -> match Btype.row_field_repr f with
                  Rpresent (Some t) -> t
                | Reither (_,[t],_,_) -> t
                | Reither (_,tl,_,_) -> Btype.newgenty (Ttuple tl)
                | _ -> Btype.newgenty (Ttuple[]))
                "case" (fun (lab,_) -> "`" ^ lab ^ " of ")
          | _ -> trivial ty'
          end
      | _ -> ()
      with Not_found -> ()
      end
  | Unbound_exception lid ->
      fprintf ppf "Unbound exception constructor@ %a" Printtyp.longident lid
  | Not_an_exception lid ->
      fprintf ppf "The constructor@ %a@ is not an exception"
        Printtyp.longident lid
  | Bad_variance (n, v1, v2) ->
      let variance = function
          (true, true)  -> "invariant"
        | (true, false) -> "covariant"
        | (false,true)  -> "contravariant"
        | (false,false) -> "unrestricted"
      in
      if n < 1 then
        fprintf ppf "%s@ %s@ %s"
          "In this definition, a type variable"
          "has a variance that is not reflected"
          "by its occurence in type parameters."
      else
        fprintf ppf "%s@ %s@ %s %d%s %s %s,@ %s %s"
          "In this definition, expected parameter"
          "variances are not satisfied."
          "The" n (match n with 1 -> "st" | 2 -> "nd" | 3 -> "rd" | _ -> "th")
          "type parameter was expected to be" (variance v2)
          "but it is" (variance v1)
  | Unavailable_type_constructor p ->
      fprintf ppf "The definition of type %a@ is unavailable" Printtyp.path p
  | Bad_fixed_type r ->
      fprintf ppf "This fixed type %s" r
