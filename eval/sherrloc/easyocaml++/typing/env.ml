(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*            Xavier Leroy, projet Cristal, INRIA Rocquencourt         *)
(*                                                                     *)
(*  Copyright 1996 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: env.ml,v 1.58 2006/10/13 12:56:28 xleroy Exp $ *)

(* Environment handling *)

open Config
open Misc
open Asttypes
open Longident
open Path
open Types


type error =
    Not_an_interface of string
  | Corrupted_interface of string
  | Illegal_renaming of string * string
  | Inconsistent_import of string * string * string
  | Need_recursive_types of string * string

exception Error of error

type summary =
    Env_empty
  | Env_value of summary * Ident.t * value_description
  | Env_type of summary * Ident.t * type_declaration
  | Env_exception of summary * Ident.t * exception_declaration
  | Env_module of summary * Ident.t * module_type
  | Env_modtype of summary * Ident.t * modtype_declaration
  | Env_class of summary * Ident.t * class_declaration
  | Env_cltype of summary * Ident.t * cltype_declaration
  | Env_open of summary * Path.t

type t = {
  values: (Path.t * value_description) Ident.tbl;
  constrs: constructor_description Ident.tbl;
  labels: label_description Ident.tbl;
  types: (Path.t * type_declaration) Ident.tbl;
  modules: (Path.t * module_type) Ident.tbl;
  modtypes: (Path.t * modtype_declaration) Ident.tbl;
  components: (Path.t * module_components) Ident.tbl;
  classes: (Path.t * class_declaration) Ident.tbl;
  cltypes: (Path.t * cltype_declaration) Ident.tbl;
  summary: summary
}

and module_components = module_components_repr Lazy.t

and module_components_repr =
    Structure_comps of structure_components
  | Functor_comps of functor_components

and structure_components = {
  mutable comp_values: (string, (value_description * int)) Tbl.t;
  mutable comp_constrs: (string, (constructor_description * int)) Tbl.t;
  mutable comp_labels: (string, (label_description * int)) Tbl.t;
  mutable comp_types: (string, (type_declaration * int)) Tbl.t;
  mutable comp_modules: (string, (module_type Lazy.t * int)) Tbl.t;
  mutable comp_modtypes: (string, (modtype_declaration * int)) Tbl.t;
  mutable comp_components: (string, (module_components * int)) Tbl.t;
  mutable comp_classes: (string, (class_declaration * int)) Tbl.t;
  mutable comp_cltypes: (string, (cltype_declaration * int)) Tbl.t
}

and functor_components = {
  fcomp_param: Ident.t;                 (* Formal parameter *)
  fcomp_arg: module_type;               (* Argument signature *)
  fcomp_res: module_type;               (* Result signature *)
  fcomp_env: t;     (* Environment in which the result signature makes sense *)
  fcomp_subst: Subst.t;  (* Prefixing substitution for the result signature *)
  fcomp_cache: (Path.t, module_components) Hashtbl.t  (* For memoization *)
}

let empty = {
  values = Ident.empty; constrs = Ident.empty;
  labels = Ident.empty; types = Ident.empty;
  modules = Ident.empty; modtypes = Ident.empty;
  components = Ident.empty; classes = Ident.empty;
  cltypes = Ident.empty;
  summary = Env_empty }

let diff_keys tbl1 tbl2 =
  let keys2 = Ident.keys tbl2 in
  List.filter
    (fun id ->
      match Ident.find_same id tbl2 with Pident _, _ ->
        (try ignore (Ident.find_same id tbl1); false with Not_found -> true)
      | _ -> false)
    keys2

let diff env1 env2 =
  diff_keys env1.values env2.values @
  diff_keys env1.modules env2.modules @
  diff_keys env1.classes env2.classes

(* Forward declarations *)

let components_of_module' =
  ref ((fun env sub path mty -> assert false) :
          t -> Subst.t -> Path.t -> module_type -> module_components)
let components_of_functor_appl' =
  ref ((fun f p1 p2 -> assert false) :
          functor_components -> Path.t -> Path.t -> module_components)
let check_modtype_inclusion =
  (* to be filled with Includemod.check_modtype_inclusion *)
  ref ((fun env mty1 path1 mty2 -> assert false) :
          t -> module_type -> Path.t -> module_type -> unit)

(* The name of the compilation unit currently compiled.
   "" if outside a compilation unit. *)

let current_unit = ref ""

(* Persistent structure descriptions *)

type pers_flags = Rectypes

type pers_struct =
  { ps_name: string;
    ps_sig: signature;
    ps_comps: module_components;
    ps_crcs: (string * Digest.t) list;
    ps_filename: string;
    ps_flags: pers_flags list }

let persistent_structures =
  (Hashtbl.create 17 : (string, pers_struct) Hashtbl.t)

(* Consistency between persistent structures *)

let crc_units = Consistbl.create()

let check_consistency filename crcs =
  try
    List.iter
      (fun (name, crc) -> Consistbl.check crc_units name crc filename)
      crcs
  with Consistbl.Inconsistency(name, source, auth) ->
    raise(Error(Inconsistent_import(name, auth, source)))

(* Reading persistent structures from .cmi files *)

let read_pers_struct modname filename : pers_struct =
  let ic = open_in_bin filename in
  try
    let buffer = String.create (String.length cmi_magic_number) in
    really_input ic buffer 0 (String.length cmi_magic_number);
    if buffer <> cmi_magic_number then begin
      close_in ic;
      raise(Error(Not_an_interface filename))
    end;
    let (name, sign) = input_value ic in
    let crcs = input_value ic in
    let flags = input_value ic in
    close_in ic;
    let comps =
      !components_of_module' empty Subst.identity
                             (Pident(Ident.create_persistent name))
                             (Tmty_signature sign) in
    let ps = { ps_name = name;
               ps_sig = sign;
               ps_comps = comps;
               ps_crcs = crcs;
               ps_filename = filename;
               ps_flags = flags } in
    if ps.ps_name <> modname then
      raise(Error(Illegal_renaming(ps.ps_name, filename)));
    check_consistency filename ps.ps_crcs;
    List.iter
      (function Rectypes ->
        if not !Clflags.recursive_types then
          raise(Error(Need_recursive_types(ps.ps_name, !current_unit))))
      ps.ps_flags;
    Hashtbl.add persistent_structures modname ps;
    ps
  with End_of_file | Failure _ ->
    close_in ic;
    raise(Error(Corrupted_interface(filename)))

let find_pers_struct name =
  try
    Hashtbl.find persistent_structures name
  with Not_found ->
    read_pers_struct name (find_in_path_uncap !load_path (name ^ ".cmi"))

let find_pers_struct' name =
  let ps = find_pers_struct name in
  ps.ps_sig


let reset_cache () =
  current_unit := "";
  Hashtbl.clear persistent_structures;
  Consistbl.clear crc_units

let set_unit_name name =
  current_unit := name

(* Lookup by identifier *)

let rec find_module_descr path env =
  match path with
    Pident id ->
      begin try
        let (p, desc) = Ident.find_same id env.components
        in desc
      with Not_found ->
        if Ident.persistent id
        then (find_pers_struct (Ident.name id)).ps_comps
        else raise Not_found
      end
  | Pdot(p, s, pos) ->
      begin match Lazy.force(find_module_descr p env) with
        Structure_comps c ->
          let (descr, pos) = Tbl.find s c.comp_components in
          descr
      | Functor_comps f ->
         raise Not_found
      end
  | Papply(p1, p2) ->
      begin match Lazy.force(find_module_descr p1 env) with
        Functor_comps f ->
          !components_of_functor_appl' f p1 p2
      | Structure_comps c ->
          raise Not_found
      end

let find proj1 proj2 path env =
  match path with
    Pident id ->
      let (p, data) = Ident.find_same id (proj1 env)
      in data
  | Pdot(p, s, pos) ->
      begin match Lazy.force(find_module_descr p env) with
        Structure_comps c ->
          let (data, pos) = Tbl.find s (proj2 c) in data
      | Functor_comps f ->
          raise Not_found
      end
  | Papply(p1, p2) ->
      raise Not_found

let value_domain env = Ident.keys env.values
let type_domain env = Ident.keys env.types
let module_domain env = Ident.keys env.modules
let constructor_domain env = Ident.keys env.constrs
let module_domain env = Ident.keys env.modules

let find_value =
  find (fun env -> env.values) (fun sc -> sc.comp_values)
and find_type =
  find (fun env -> env.types) (fun sc -> sc.comp_types)
and find_modtype =
  find (fun env -> env.modtypes) (fun sc -> sc.comp_modtypes)
and find_class =
  find (fun env -> env.classes) (fun sc -> sc.comp_classes)
and find_cltype =
  find (fun env -> env.cltypes) (fun sc -> sc.comp_cltypes)

let find_type_expansion path env =
  let decl = find_type path env in
  match decl.type_manifest with
    None      -> raise Not_found
  | Some body -> (decl.type_params, body)

let find_modtype_expansion path env =
  match find_modtype path env with
    Tmodtype_abstract     -> raise Not_found
  | Tmodtype_manifest mty -> mty

let find_module path env =
  match path with
    Pident id ->
      begin try
        let (p, data) = Ident.find_same id env.modules
        in data
      with Not_found ->
        if Ident.persistent id then
          let ps = find_pers_struct (Ident.name id) in
          Tmty_signature(ps.ps_sig)
        else raise Not_found
      end
  | Pdot(p, s, pos) ->
      begin match Lazy.force (find_module_descr p env) with
        Structure_comps c ->
          let (data, pos) = Tbl.find s c.comp_modules in Lazy.force data
      | Functor_comps f ->
          raise Not_found
      end
  | Papply(p1, p2) ->
      raise Not_found (* not right *)

(* Lookup by name *)

let rec lookup_module_descr lid env =
  match lid with
    Lident s ->
      begin try
        Ident.find_name s env.components
      with Not_found ->
        if s = !current_unit then raise Not_found;
        let ps = find_pers_struct s in
        (Pident(Ident.create_persistent s), ps.ps_comps)
      end
  | Ldot(l, s) ->
      let (p, descr) = lookup_module_descr l env in
      begin match Lazy.force descr with
        Structure_comps c ->
          let (descr, pos) = Tbl.find s c.comp_components in
          (Pdot(p, s, pos), descr)
      | Functor_comps f ->
          raise Not_found
      end
  | Lapply(l1, l2) ->
      let (p1, desc1) = lookup_module_descr l1 env in
      let (p2, mty2) = lookup_module l2 env in
      begin match Lazy.force desc1 with
        Functor_comps f ->
          !check_modtype_inclusion env mty2 p2 f.fcomp_arg;
          (Papply(p1, p2), !components_of_functor_appl' f p1 p2)
      | Structure_comps c ->
          raise Not_found
      end

and lookup_module lid env =
  match lid with
    Lident s ->
      begin try
        Ident.find_name s env.modules
      with Not_found ->
        if s = !current_unit then raise Not_found;
        let ps = find_pers_struct s in
        (Pident(Ident.create_persistent s), Tmty_signature ps.ps_sig)
      end
  | Ldot(l, s) ->
      let (p, descr) = lookup_module_descr l env in
      begin match Lazy.force descr with
        Structure_comps c ->
          let (data, pos) = Tbl.find s c.comp_modules in
          (Pdot(p, s, pos), Lazy.force data)
      | Functor_comps f ->
          raise Not_found
      end
  | Lapply(l1, l2) ->
      let (p1, desc1) = lookup_module_descr l1 env in
      let (p2, mty2) = lookup_module l2 env in
      let p = Papply(p1, p2) in
      begin match Lazy.force desc1 with
        Functor_comps f ->
          !check_modtype_inclusion env mty2 p2 f.fcomp_arg;
          (p, Subst.modtype (Subst.add_module f.fcomp_param p2 f.fcomp_subst)
                            f.fcomp_res)
      | Structure_comps c ->
          raise Not_found
      end

let lookup proj1 proj2 lid env =
  match lid with
    Lident s ->
      Ident.find_name s (proj1 env)
  | Ldot(l, s) ->
      let (p, desc) = lookup_module_descr l env in
      begin match Lazy.force desc with
        Structure_comps c ->
          let (data, pos) = Tbl.find s (proj2 c) in
          (Pdot(p, s, pos), data)
      | Functor_comps f ->
          raise Not_found
      end
  | Lapply(l1, l2) ->
      raise Not_found

let lookup_simple proj1 proj2 lid env =
  match lid with
    Lident s ->
      Ident.find_name s (proj1 env)
  | Ldot(l, s) ->
      let (p, desc) = lookup_module_descr l env in
      begin match Lazy.force desc with
        Structure_comps c ->
          let (data, pos) = Tbl.find s (proj2 c) in
          data
      | Functor_comps f ->
          raise Not_found
      end
  | Lapply(l1, l2) ->
      raise Not_found

let lookup_value =
  lookup (fun env -> env.values) (fun sc -> sc.comp_values)
and lookup_constructor =
  lookup_simple (fun env -> env.constrs) (fun sc -> sc.comp_constrs)
and lookup_label =
  lookup_simple (fun env -> env.labels) (fun sc -> sc.comp_labels)
and lookup_type =
  lookup (fun env -> env.types) (fun sc -> sc.comp_types)
and lookup_modtype =
  lookup (fun env -> env.modtypes) (fun sc -> sc.comp_modtypes)
and lookup_class =
  lookup (fun env -> env.classes) (fun sc -> sc.comp_classes)
and lookup_cltype =
  lookup (fun env -> env.cltypes) (fun sc -> sc.comp_cltypes)

(* Expand manifest module type names at the top of the given module type *)

let rec scrape_modtype mty env =
  match mty with
    Tmty_ident path ->
      begin try
        scrape_modtype (find_modtype_expansion path env) env
      with Not_found ->
        mty
      end
  | _ -> mty

(* Compute constructor descriptions *)

let constructors_of_type ty_path decl =
  match decl.type_kind with
    Type_variant(cstrs, priv) ->
      Datarepr.constructor_descrs
        (Btype.newgenty (Tconstr(ty_path, decl.type_params, ref Mnil)))
        cstrs priv
  | Type_record _ | Type_abstract -> []

(* Compute label descriptions *)

let labels_of_type ty_path decl =
  match decl.type_kind with
    Type_record(labels, rep, priv) ->
      Datarepr.label_descrs
        (Btype.newgenty (Tconstr(ty_path, decl.type_params, ref Mnil)))
        labels rep priv
  | Type_variant _ | Type_abstract -> []

(* Given a signature and a root path, prefix all idents in the signature
   by the root path and build the corresponding substitution. *)

let rec prefix_idents root pos sub = function
    [] -> ([], sub)
  | Tsig_value(id, decl) :: rem ->
      let p = Pdot(root, Ident.name id, pos) in
      let nextpos = match decl.val_kind with Val_prim _ -> pos | _ -> pos+1 in
      let (pl, final_sub) = prefix_idents root nextpos sub rem in
      (p::pl, final_sub)
  | Tsig_type(id, decl, _) :: rem ->
      let p = Pdot(root, Ident.name id, nopos) in
      let (pl, final_sub) =
        prefix_idents root pos (Subst.add_type id p sub) rem in
      (p::pl, final_sub)
  | Tsig_exception(id, decl) :: rem ->
      let p = Pdot(root, Ident.name id, pos) in
      let (pl, final_sub) = prefix_idents root (pos+1) sub rem in
      (p::pl, final_sub)
  | Tsig_module(id, mty, _) :: rem ->
      let p = Pdot(root, Ident.name id, pos) in
      let (pl, final_sub) =
        prefix_idents root (pos+1) (Subst.add_module id p sub) rem in
      (p::pl, final_sub)
  | Tsig_modtype(id, decl) :: rem ->
      let p = Pdot(root, Ident.name id, nopos) in
      let (pl, final_sub) =
        prefix_idents root pos
                      (Subst.add_modtype id (Tmty_ident p) sub) rem in
      (p::pl, final_sub)
  | Tsig_class(id, decl, _) :: rem ->
      let p = Pdot(root, Ident.name id, pos) in
      let (pl, final_sub) = prefix_idents root (pos + 1) sub rem in
      (p::pl, final_sub)
  | Tsig_cltype(id, decl, _) :: rem ->
      let p = Pdot(root, Ident.name id, nopos) in
      let (pl, final_sub) = prefix_idents root pos sub rem in
      (p::pl, final_sub)

(* Compute structure descriptions *)

let rec components_of_module env sub path mty =
  lazy(match scrape_modtype mty env with
    Tmty_signature sg ->
      let c =
        { comp_values = Tbl.empty; comp_constrs = Tbl.empty;
          comp_labels = Tbl.empty; comp_types = Tbl.empty;
          comp_modules = Tbl.empty; comp_modtypes = Tbl.empty;
          comp_components = Tbl.empty; comp_classes = Tbl.empty;
          comp_cltypes = Tbl.empty } in
      let (pl, sub) = prefix_idents path 0 sub sg in
      let env = ref env in
      let pos = ref 0 in
      List.iter2 (fun item path ->
        match item with
          Tsig_value(id, decl) ->
            let decl' = Subst.value_description sub decl in
            c.comp_values <-
              Tbl.add (Ident.name id) (decl', !pos) c.comp_values;
            begin match decl.val_kind with
              Val_prim _ -> () | _ -> incr pos
            end
        | Tsig_type(id, decl, _) ->
            let decl' = Subst.type_declaration sub decl in
            c.comp_types <-
              Tbl.add (Ident.name id) (decl', nopos) c.comp_types;
            List.iter
              (fun (name, descr) ->
                c.comp_constrs <- Tbl.add name (descr, nopos) c.comp_constrs)
              (constructors_of_type path decl');
            List.iter
              (fun (name, descr) ->
                c.comp_labels <- Tbl.add name (descr, nopos) c.comp_labels)
              (labels_of_type path decl'); 
            env := store_type_infos id path decl !env
        | Tsig_exception(id, decl) ->
            let decl' = Subst.exception_declaration sub decl in
            let cstr = Datarepr.exception_descr path decl' in
            c.comp_constrs <-
              Tbl.add (Ident.name id) (cstr, !pos) c.comp_constrs;
            incr pos
        | Tsig_module(id, mty, _) ->
            let mty' = lazy (Subst.modtype sub mty) in
            c.comp_modules <-
              Tbl.add (Ident.name id) (mty', !pos) c.comp_modules;
            let comps = components_of_module !env sub path mty in
            c.comp_components <-
              Tbl.add (Ident.name id) (comps, !pos) c.comp_components;
            env := store_module id path mty !env;
            incr pos
        | Tsig_modtype(id, decl) ->
            let decl' = Subst.modtype_declaration sub decl in
            c.comp_modtypes <-
              Tbl.add (Ident.name id) (decl', nopos) c.comp_modtypes;
            env := store_modtype id path decl !env
        | Tsig_class(id, decl, _) ->
            let decl' = Subst.class_declaration sub decl in
            c.comp_classes <-
              Tbl.add (Ident.name id) (decl', !pos) c.comp_classes;
            incr pos
        | Tsig_cltype(id, decl, _) ->
            let decl' = Subst.cltype_declaration sub decl in
            c.comp_cltypes <-
              Tbl.add (Ident.name id) (decl', !pos) c.comp_cltypes)
        sg pl;
        Structure_comps c
  | Tmty_functor(param, ty_arg, ty_res) ->
        Functor_comps {
          fcomp_param = param;
          (* fcomp_arg must be prefixed eagerly, because it is interpreted
             in the outer environment, not in env *)
          fcomp_arg = Subst.modtype sub ty_arg;
          (* fcomp_res is prefixed lazily, because it is interpreted in env *)
          fcomp_res = ty_res;
          fcomp_env = env;
          fcomp_subst = sub;
          fcomp_cache = Hashtbl.create 17 }
  | Tmty_ident p ->
        Structure_comps {
          comp_values = Tbl.empty; comp_constrs = Tbl.empty;
          comp_labels = Tbl.empty; comp_types = Tbl.empty;
          comp_modules = Tbl.empty; comp_modtypes = Tbl.empty;
          comp_components = Tbl.empty; comp_classes = Tbl.empty;
          comp_cltypes = Tbl.empty })

(* Insertion of bindings by identifier + path *)

and store_value id path decl env =
  { env with
    values = Ident.add id (path, decl) env.values;
    summary = Env_value(env.summary, id, decl) }

and store_type id path info env =
  { env with
    constrs =
      List.fold_right
        (fun (name, descr) constrs ->
          Ident.add (Ident.create name) descr constrs)
        (constructors_of_type path info)
        env.constrs;
    labels =
      List.fold_right
        (fun (name, descr) labels ->
          Ident.add (Ident.create name) descr labels)
        (labels_of_type path info)
        env.labels;
    types = Ident.add id (path, info) env.types;
    summary = Env_type(env.summary, id, info) }

and store_type_infos id path info env =
  (* Simplified version of store_type that doesn't compute and store
     constructor and label infos, but simply record the arity and
     manifest-ness of the type.  Used in components_of_module to
     keep track of type abbreviations (e.g. type t = float) in the
     computation of label representations. *)
  { env with
    types = Ident.add id (path, info) env.types;
    summary = Env_type(env.summary, id, info) }

and store_exception id path decl env =
  { env with
    constrs = Ident.add id (Datarepr.exception_descr path decl) env.constrs;
    summary = Env_exception(env.summary, id, decl) }

and store_module id path mty env =
  { env with
    modules = Ident.add id (path, mty) env.modules;
    components =
      Ident.add id (path, components_of_module env Subst.identity path mty)
                   env.components;
    summary = Env_module(env.summary, id, mty) }

and store_modtype id path info env =
  { env with
    modtypes = Ident.add id (path, info) env.modtypes;
    summary = Env_modtype(env.summary, id, info) }

and store_class id path desc env =
  { env with
    classes = Ident.add id (path, desc) env.classes;
    summary = Env_class(env.summary, id, desc) }

and store_cltype id path desc env =
  { env with
    cltypes = Ident.add id (path, desc) env.cltypes;
    summary = Env_cltype(env.summary, id, desc) }

(* Compute the components of a functor application in a path. *)

let components_of_functor_appl f p1 p2 =
  try
    Hashtbl.find f.fcomp_cache p2
  with Not_found ->
    let p = Papply(p1, p2) in
    let mty = 
      Subst.modtype (Subst.add_module f.fcomp_param p2 Subst.identity)
                    f.fcomp_res in
    let comps = components_of_module f.fcomp_env f.fcomp_subst p mty in
    Hashtbl.add f.fcomp_cache p2 comps;
    comps

(* Define forward functions *)

let _ =
  components_of_module' := components_of_module;
  components_of_functor_appl' := components_of_functor_appl

(* Insertion of bindings by identifier *)

let add_value id desc env =
  store_value id (Pident id) desc env

and add_type id info env =
  store_type id (Pident id) info env

and add_exception id decl env =
  store_exception id (Pident id) decl env

and add_module id mty env =
  store_module id (Pident id) mty env

and add_modtype id info env =
  store_modtype id (Pident id) info env

and add_class id ty env =
  store_class id (Pident id) ty env

and add_cltype id ty env =
  store_cltype id (Pident id) ty env

(* Insertion of bindings by name *)

let enter store_fun name data env =
  let id = Ident.create name in (id, store_fun id (Pident id) data env)

let enter_value = enter store_value
and enter_type = enter store_type
and enter_exception = enter store_exception
and enter_module = enter store_module
and enter_modtype = enter store_modtype
and enter_class = enter store_class
and enter_cltype = enter store_cltype

(* Insertion of all components of a signature *)

let add_item comp env =
  match comp with
    Tsig_value(id, decl)     -> add_value id decl env
  | Tsig_type(id, decl, _)   -> add_type id decl env
  | Tsig_exception(id, decl) -> add_exception id decl env
  | Tsig_module(id, mty, _)  -> add_module id mty env
  | Tsig_modtype(id, decl)   -> add_modtype id decl env
  | Tsig_class(id, decl, _)  -> add_class id decl env
  | Tsig_cltype(id, decl, _) -> add_cltype id decl env

let rec add_signature sg env =
  match sg with
    [] -> env
  | comp :: rem -> add_signature rem (add_item comp env)

(* Open a signature path *)

let open_signature root sg env =
  (* First build the paths and substitution *)
  let (pl, sub) = prefix_idents root 0 Subst.identity sg in
  (* Then enter the components in the environment after substitution *)
  let newenv =
    List.fold_left2
      (fun env item p ->
        match item with
          Tsig_value(id, decl) ->
            store_value (Ident.hide id) p
                        (Subst.value_description sub decl) env
        | Tsig_type(id, decl, _) ->
            store_type (Ident.hide id) p
                       (Subst.type_declaration sub decl) env
        | Tsig_exception(id, decl) ->
            store_exception (Ident.hide id) p
                            (Subst.exception_declaration sub decl) env
        | Tsig_module(id, mty, _) ->
            store_module (Ident.hide id) p (Subst.modtype sub mty) env
        | Tsig_modtype(id, decl) ->
            store_modtype (Ident.hide id) p
                          (Subst.modtype_declaration sub decl) env
        | Tsig_class(id, decl, _) ->
            store_class (Ident.hide id) p
                        (Subst.class_declaration sub decl) env
        | Tsig_cltype(id, decl, _) ->
            store_cltype (Ident.hide id) p
                         (Subst.cltype_declaration sub decl) env)
      env sg pl in
  { newenv with summary = Env_open(env.summary, root) }
  
(* Open a signature from a file *)

let open_pers_signature name env =
  let ps = find_pers_struct name in
  open_signature (Pident(Ident.create_persistent name)) ps.ps_sig env

(* Read a signature from a file *)

let read_signature modname filename =
  let ps = read_pers_struct modname filename in ps.ps_sig

(* Return the CRC of the interface of the given compilation unit *)

let crc_of_unit name =
  let ps = find_pers_struct name in
  try
    List.assoc name ps.ps_crcs
  with Not_found ->
    assert false

(* Return the list of imported interfaces with their CRCs *)

let imported_units() =
  Consistbl.extract crc_units

(* Save a signature to a file *)

let save_signature_with_imports sg modname filename imports =
  Btype.cleanup_abbrev ();
  Subst.reset_for_saving ();
  let sg = Subst.signature (Subst.for_saving Subst.identity) sg in
  let oc = open_out_bin filename in
  try
    output_string oc cmi_magic_number;
    output_value oc (modname, sg);
    flush oc;
    let crc = Digest.file filename in
    let crcs = (modname, crc) :: imports in
    output_value oc crcs;
    let flags = if !Clflags.recursive_types then [Rectypes] else [] in
    output_value oc flags;
    close_out oc;
    (* Enter signature in persistent table so that imported_unit()
       will also return its crc *)
    let comps =
      components_of_module empty Subst.identity
        (Pident(Ident.create_persistent modname)) (Tmty_signature sg) in
    let ps =
      { ps_name = modname;
        ps_sig = sg;
        ps_comps = comps;
        ps_crcs = crcs;
        ps_filename = filename;
        ps_flags = flags } in
    Hashtbl.add persistent_structures modname ps;
    Consistbl.set crc_units modname crc filename
  with exn ->
    close_out oc;
    remove_file filename;
    raise exn

let save_signature sg modname filename =
  save_signature_with_imports sg modname filename (imported_units())

(* Make the initial environment *)

let initial = Predef.build_initial_env add_type add_exception empty

(* Return the environment summary *)

let summary env = env.summary


let print_simple ppf env =
  List.iter
    (fun id ->
       Format.fprintf ppf "%s,@ " (Ident.unique_name id))
    (value_domain env)

(* Error report *)

open Format

let report_error ppf = function
  | Not_an_interface filename -> fprintf ppf
      "%s@ is not a compiled interface" filename
  | Corrupted_interface filename -> fprintf ppf
      "Corrupted compiled interface@ %s" filename
  | Illegal_renaming(modname, filename) -> fprintf ppf
      "Wrong file naming: %s@ contains the compiled interface for@ %s"
      filename modname
  | Inconsistent_import(name, source1, source2) -> fprintf ppf
      "@[<hov>The files %s@ and %s@ \
              make inconsistent assumptions@ over interface %s@]"
      source1 source2 name
  | Need_recursive_types(import, export) ->
      fprintf ppf
        "@[<hov>Unit %s imports from %s, which uses recursive types.@ %s@]"
        import export "The compilation flag -rectypes is required"
