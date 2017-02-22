(***********************************************************************)
(*                             OCamldoc                                *)
(*                                                                     *)
(*            Maxence Guesdon, projet Cristal, INRIA Rocquencourt      *)
(*                                                                     *)
(*  Copyright 2001 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: odoc_sig.ml,v 1.39 2007/02/09 13:31:15 doligez Exp $ *)

(** Analysis of interface files. *)

open Misc
open Asttypes
open Types
open Typedtree
open Path

let print_DEBUG s = print_string s ; print_newline ();;

module Name = Odoc_name
open Odoc_parameter
open Odoc_value
open Odoc_type
open Odoc_exception
open Odoc_class
open Odoc_module
open Odoc_types

module Signature_search =
  struct
    type ele =
      | M of string
      | MT of string
      | V of string
      | T of string
      | C of string
      | CT of string
      | E of string
      | ER of string
      | P of string

    type tab = (ele, Types.signature_item) Hashtbl.t

    let add_to_hash table signat =
      match signat with
        Types.Tsig_value (ident, _) ->
          Hashtbl.add table (V (Name.from_ident ident)) signat
      | Types.Tsig_exception (ident, _) ->
          Hashtbl.add table (E (Name.from_ident ident)) signat
      | Types.Tsig_type (ident, _, _) ->
          Hashtbl.add table (T (Name.from_ident ident)) signat
      | Types.Tsig_class (ident, _, _) ->
          Hashtbl.add table (C (Name.from_ident ident)) signat
      | Types.Tsig_cltype (ident, _, _) ->
          Hashtbl.add table (CT (Name.from_ident ident)) signat
      | Types.Tsig_module (ident, _, _) ->
          Hashtbl.add table (M (Name.from_ident ident)) signat
      | Types.Tsig_modtype (ident,_) ->
          Hashtbl.add table (MT (Name.from_ident ident)) signat

    let table signat =
      let t = Hashtbl.create 13 in
      List.iter (add_to_hash t) signat;
      t

    let search_value table name =
      match Hashtbl.find table (V name) with
      | (Types.Tsig_value (_, val_desc)) ->  val_desc.Types.val_type
      | _ -> assert false

    let search_exception table name =
      match Hashtbl.find table (E name) with
      | (Types.Tsig_exception (_, type_expr_list)) ->
          type_expr_list
      | _ -> assert false

    let search_type table name =
      match Hashtbl.find table (T name) with
      | (Types.Tsig_type (_, type_decl, _)) -> type_decl
      | _ -> assert false

    let search_class table name =
      match Hashtbl.find table (C name) with
      | (Types.Tsig_class (_, class_decl, _)) -> class_decl
      | _ -> assert false

    let search_class_type table name =
      match Hashtbl.find table (CT name) with
      | (Types.Tsig_cltype (_, cltype_decl, _)) -> cltype_decl
      | _ -> assert false

    let search_module table name =
      match Hashtbl.find table (M name) with
      | (Types.Tsig_module (ident, module_type, _)) -> module_type
      | _ -> assert false

    let search_module_type table name =
      match Hashtbl.find table (MT name) with
      | (Types.Tsig_modtype (_, Types.Tmodtype_manifest module_type)) ->
          Some module_type
      | (Types.Tsig_modtype (_, Types.Tmodtype_abstract)) ->
          None
      | _ -> assert false

    let search_attribute_type name class_sig =
      let (_, _, type_expr) = Types.Vars.find name class_sig.Types.cty_vars in
      type_expr

    let search_method_type name class_sig =
      let fields = Odoc_misc.get_fields class_sig.Types.cty_self in
      List.assoc name fields
  end

module type Info_retriever =
  sig
    val all_special : string -> string -> int * (Odoc_types.info list)
    val blank_line_outside_simple : string -> string -> bool
    val just_after_special : string -> string -> (int * Odoc_types.info option)
    val first_special : string -> string -> (int * Odoc_types.info option)
    val get_comments :
        (Odoc_types.text -> 'a) -> string -> string -> (Odoc_types.info option * 'a list)
  end

module Analyser =
  functor (My_ir : Info_retriever) ->
  struct
    (** This variable is used to load a file as a string and retrieve characters from it.*)
    let file = ref ""
    (** The name of the analysed file. *)
    let file_name = ref ""

    (** This function takes two indexes (start and end) and return the string
       corresponding to the indexes in the file global variable. The function
       prepare_file must have been called to fill the file global variable.*)
    let get_string_of_file the_start the_end =
      try
        let s = String.sub !file the_start (the_end-the_start) in
        s
      with
        Invalid_argument _ ->
          ""

    (** This function loads the given file in the file global variable,
       and sets file_name.*)
    let prepare_file f input_f =
      try
        let s = Odoc_misc.input_file_as_string input_f in
        file := s;
        file_name := f
      with
        e ->
          file := "";
          raise e

    (** The function used to get the comments in a class. *)
    let get_comments_in_class pos_start pos_end =
      My_ir.get_comments (fun t -> Class_comment t)
        !file_name
        (get_string_of_file pos_start pos_end)

    (** The function used to get the comments in a module. *)
    let get_comments_in_module pos_start pos_end =
      My_ir.get_comments (fun t -> Element_module_comment t)
        !file_name
        (get_string_of_file pos_start pos_end)

    let merge_infos = Odoc_merge.merge_info_opt Odoc_types.all_merge_options

    let name_comment_from_type_kind pos_end pos_limit tk =
      match tk with
        Parsetree.Ptype_abstract | Parsetree.Ptype_private ->
          (0, [])
      | Parsetree.Ptype_variant (cons_core_type_list_list, _) ->
          let rec f acc cons_core_type_list_list =
            match cons_core_type_list_list with
              [] ->
                (0, acc)
            | (name, core_type_list, loc) :: [] ->
                let s = get_string_of_file
                    loc.Location.loc_end.Lexing.pos_cnum
                    pos_limit
                in
                let (len, comment_opt) =  My_ir.just_after_special !file_name s in
                (len, acc @ [ (name, comment_opt) ])
            | (name, core_type_list, loc) :: (name2, core_type_list2, loc2)
              :: q ->
                let pos_end_first = loc.Location.loc_end.Lexing.pos_cnum in
                let pos_start_second = loc2.Location.loc_start.Lexing.pos_cnum in
                let s = get_string_of_file pos_end_first pos_start_second in
                let (_,comment_opt) = My_ir.just_after_special !file_name  s in
                f (acc @ [name, comment_opt])
                  ((name2, core_type_list2, loc2) :: q)
          in
          f [] cons_core_type_list_list

      | Parsetree.Ptype_record (name_mutable_type_list, _) (* of (string * mutable_flag * core_type) list*) ->
          let rec f = function
              [] ->
                []
            | (name, _, ct, xxloc) :: [] ->
                let pos = ct.Parsetree.ptyp_loc.Location.loc_end.Lexing.pos_cnum in
                let s = get_string_of_file pos pos_end in
                let (_,comment_opt) =  My_ir.just_after_special !file_name s in
                [name, comment_opt]
            | (name,_,ct,xxloc) :: ((name2,_,ct2,xxloc2) as ele2) :: q ->
                let pos = ct.Parsetree.ptyp_loc.Location.loc_end.Lexing.pos_cnum in
                let pos2 = ct2.Parsetree.ptyp_loc.Location.loc_start.Lexing.pos_cnum in
                let s = get_string_of_file pos pos2 in
                let (_,comment_opt) =  My_ir.just_after_special !file_name s in
                (name, comment_opt) :: (f (ele2 :: q))
          in
          (0, f name_mutable_type_list)

    let get_type_kind env name_comment_list type_kind =
      match type_kind with
        Types.Type_abstract ->
          Odoc_type.Type_abstract

      | Types.Type_variant (l, priv) ->
          let f (constructor_name, type_expr_list) =
            let comment_opt =
              try
                match List.assoc constructor_name name_comment_list with
                  None -> None
                | Some d -> d.Odoc_types.i_desc
              with Not_found -> None
            in
            {
              vc_name = constructor_name ;
              vc_args = List.map (Odoc_env.subst_type env) type_expr_list ;
              vc_text = comment_opt
            }
          in
          Odoc_type.Type_variant (List.map f l, priv = Asttypes.Private)

      | Types.Type_record (l, _, priv) ->
          let f (field_name, mutable_flag, type_expr) =
            let comment_opt =
              try
                match List.assoc field_name name_comment_list with
                  None -> None
                | Some d -> d.Odoc_types.i_desc
              with Not_found -> None
            in
            {
              rf_name = field_name ;
              rf_mutable = mutable_flag = Mutable ;
              rf_type = Odoc_env.subst_type env type_expr ;
              rf_text = comment_opt
            }
          in
          Odoc_type.Type_record (List.map f l, priv = Asttypes.Private)

    (** Analysis of the elements of a class, from the information in the parsetree and in the class
       signature. @return the couple (inherited_class list, elements).*)
    let analyse_class_elements env current_class_name last_pos pos_limit
        class_type_field_list class_signature =
      print_DEBUG "Types.Tcty_signature class_signature";
      let f_DEBUG var (mutable_flag, type_exp) = print_DEBUG var in
      Types.Vars.iter f_DEBUG class_signature.Types.cty_vars;
      print_DEBUG ("Type de la classe "^current_class_name^" : ");
      print_DEBUG (Odoc_print.string_of_type_expr class_signature.Types.cty_self);
      let get_pos_limit2 q =
        match q with
          [] -> pos_limit
        | ele2 :: _ ->
            match ele2 with
              Parsetree.Pctf_val (_, _, _, _, loc)
            | Parsetree.Pctf_virt (_, _, _, loc)
            | Parsetree.Pctf_meth (_, _, _, loc)
            | Parsetree.Pctf_cstr (_, _, loc) -> loc.Location.loc_start.Lexing.pos_cnum
            | Parsetree.Pctf_inher class_type ->
                class_type.Parsetree.pcty_loc.Location.loc_start.Lexing.pos_cnum
      in
      let get_method name comment_opt private_flag loc q =
        let complete_name = Name.concat current_class_name name in
        let typ =
          try Signature_search.search_method_type name class_signature
          with Not_found ->
            raise (Failure (Odoc_messages.method_type_not_found current_class_name name))
        in
        let subst_typ = Odoc_env.subst_type env typ in
        let met =
          {
            met_value =
            {
              val_name = complete_name ;
              val_info = comment_opt ;
              val_type = subst_typ ;
              val_recursive = false ;
              val_parameters = Odoc_value.dummy_parameter_list subst_typ ;
              val_code = None ;
              val_loc = { loc_impl = None ; loc_inter = Some (!file_name, loc.Location.loc_start.Lexing.pos_cnum) };
            } ;
            met_private = private_flag = Asttypes.Private ;
            met_virtual = false ;
          }
        in
        let pos_limit2 = get_pos_limit2 q in
        let pos_end = loc.Location.loc_end.Lexing.pos_cnum in
        let (maybe_more, info_after_opt) =
          My_ir.just_after_special
            !file_name
            (get_string_of_file pos_end pos_limit2)
        in
        met.met_value.val_info <- merge_infos met.met_value.val_info info_after_opt ;
        (* update the parameter description *)
        Odoc_value.update_value_parameters_text met.met_value;
        (met, maybe_more)
      in
      let rec f last_pos class_type_field_list =
        match class_type_field_list with
          [] ->
            let s = get_string_of_file last_pos pos_limit in
            let (_, ele_coms) = My_ir.all_special !file_name s in
            let ele_comments =
              List.fold_left
                (fun acc -> fun sc ->
                  match sc.Odoc_types.i_desc with
                    None ->
                      acc
                  | Some t ->
                      acc @ [Class_comment t])
                []
                ele_coms
            in
            ([], ele_comments)

        | Parsetree.Pctf_val (name, mutable_flag, _, _, loc) :: q ->
            (* of (string * mutable_flag * core_type option * Location.t)*)
            let (comment_opt, eles_comments) = get_comments_in_class last_pos loc.Location.loc_start.Lexing.pos_cnum in
            let complete_name = Name.concat current_class_name name in
            let typ =
              try Signature_search.search_attribute_type name class_signature
              with Not_found ->
                raise (Failure (Odoc_messages.attribute_type_not_found current_class_name name))
            in
            let subst_typ = Odoc_env.subst_type env typ in
            let att =
              {
                att_value =
                {
                  val_name = complete_name ;
                  val_info = comment_opt ;
                  val_type = subst_typ;
                  val_recursive = false ;
                  val_parameters = [] ;
                  val_code = None ;
                  val_loc = { loc_impl = None ; loc_inter = Some (!file_name, loc.Location.loc_start.Lexing.pos_cnum)} ;
                } ;
                att_mutable = mutable_flag = Asttypes.Mutable ;
              }
            in
            let pos_limit2 = get_pos_limit2 q in
            let pos_end = loc.Location.loc_end.Lexing.pos_cnum in
            let (maybe_more, info_after_opt) =
              My_ir.just_after_special
                !file_name
                (get_string_of_file pos_end pos_limit2)
            in
            att.att_value.val_info <- merge_infos att.att_value.val_info info_after_opt ;
            let (inher_l, eles) = f (pos_end + maybe_more) q in
            (inher_l, eles_comments @ ((Class_attribute att) :: eles))

        | Parsetree.Pctf_virt (name, private_flag, _, loc) :: q ->
            (* of (string * private_flag * core_type * Location.t) *)
            let (comment_opt, eles_comments) = get_comments_in_class last_pos loc.Location.loc_start.Lexing.pos_cnum in
            let (met, maybe_more) = get_method name comment_opt private_flag loc q in
            let met2 = { met with met_virtual = true } in
            let (inher_l, eles) = f (loc.Location.loc_end.Lexing.pos_cnum + maybe_more) q in
            (inher_l, eles_comments @ ((Class_method met2) :: eles))

        | Parsetree.Pctf_meth (name, private_flag, _, loc) :: q ->
            (* of (string * private_flag * core_type * Location.t) *)
            let (comment_opt, eles_comments) = get_comments_in_class last_pos loc.Location.loc_start.Lexing.pos_cnum in
            let (met, maybe_more) = get_method name comment_opt private_flag loc q in
            let (inher_l, eles) = f (loc.Location.loc_end.Lexing.pos_cnum + maybe_more) q in
            (inher_l, eles_comments @ ((Class_method met) :: eles))

        | (Parsetree.Pctf_cstr (_, _, loc)) :: q ->
            (* of (core_type * core_type * Location.t) *)
            (* A VOIR : cela correspond aux contraintes, non ? on ne les garde pas pour l'instant *)
            let (comment_opt, eles_comments) = get_comments_in_class last_pos loc.Location.loc_start.Lexing.pos_cnum in
            let (inher_l, eles) = f loc.Location.loc_end.Lexing.pos_cnum q in
            (inher_l, eles_comments @ eles)

        | Parsetree.Pctf_inher class_type :: q ->
            let loc = class_type.Parsetree.pcty_loc in
            let (comment_opt, eles_comments) =
              get_comments_in_class last_pos loc.Location.loc_start.Lexing.pos_cnum
            in
            let pos_limit2 = get_pos_limit2 q in
            let pos_end = loc.Location.loc_end.Lexing.pos_cnum in
            let (maybe_more, info_after_opt) =
              My_ir.just_after_special
                !file_name
                (get_string_of_file pos_end pos_limit2)
            in
            let comment_opt2 = merge_infos comment_opt info_after_opt in
            let text_opt = match comment_opt2 with None -> None | Some i -> i.Odoc_types.i_desc in
            let inh  =
              match class_type.Parsetree.pcty_desc with
                Parsetree.Pcty_constr (longident, _) ->
                  (*of Longident.t * core_type list*)
                  let name = Name.from_longident longident in
                  let ic =
                    {
                      ic_name = Odoc_env.full_class_or_class_type_name env name ;
                      ic_class = None ;
                      ic_text = text_opt ;
                    }
                  in
                  ic

              | Parsetree.Pcty_signature _
              | Parsetree.Pcty_fun _ ->
                  (* we don't have a name for the class signature, so we call it "object ... end"  *)
                  {
                    ic_name = Odoc_messages.object_end ;
                    ic_class = None ;
                    ic_text = text_opt ;
                  }
            in
            let (inher_l, eles) = f (pos_end + maybe_more) q in
            (inh :: inher_l , eles_comments @ eles)
      in
      f last_pos class_type_field_list

    (** Analyse of a .mli parse tree, to get the corresponding elements.
       last_pos is the position of the first character which may be used to look for special comments.
    *)
    let rec analyse_parsetree env signat current_module_name last_pos pos_limit sig_item_list =
      let table = Signature_search.table signat in
      (* we look for the comment of each item then analyse the item *)
      let rec f acc_eles acc_env last_pos = function
          [] ->
            let s = get_string_of_file last_pos pos_limit in
            let (_, ele_coms) = My_ir.all_special !file_name s in
            let ele_comments =
              List.fold_left
                (fun acc -> fun sc ->
                  match sc.Odoc_types.i_desc with
                    None ->
                      acc
                  | Some t ->
                      acc @ [Element_module_comment t])
                []
                ele_coms
            in
            acc_eles @ ele_comments

        | ele :: q ->
            let (assoc_com, ele_comments) =  get_comments_in_module
                last_pos
                ele.Parsetree.psig_loc.Location.loc_start.Lexing.pos_cnum
            in
            let (maybe_more, new_env, elements) = analyse_signature_item_desc
                acc_env
                signat
                table
                current_module_name
                ele.Parsetree.psig_loc.Location.loc_start.Lexing.pos_cnum
                ele.Parsetree.psig_loc.Location.loc_end.Lexing.pos_cnum
                (match q with
                  [] -> pos_limit
                | ele2 :: _ -> ele2.Parsetree.psig_loc.Location.loc_start.Lexing.pos_cnum
                )
                assoc_com
                ele.Parsetree.psig_desc
            in
            f (acc_eles @ (ele_comments @ elements))
              new_env
              (ele.Parsetree.psig_loc.Location.loc_end.Lexing.pos_cnum + maybe_more)
                   (* for the comments of constructors in types,
                      which are after the constructor definition and can
                      go beyond ele.Parsetree.psig_loc.Location.loc_end.Lexing.pos_cnum *)
              q
      in
      f [] env last_pos sig_item_list

    (** Analyse the given signature_item_desc to create the corresponding module element
       (with the given attached comment).*)
    and analyse_signature_item_desc env signat table current_module_name
        pos_start_ele pos_end_ele pos_limit comment_opt sig_item_desc =
        match sig_item_desc with
          Parsetree.Psig_value (name_pre, value_desc) ->
            let type_expr =
              try Signature_search.search_value table name_pre
              with Not_found ->
                raise (Failure (Odoc_messages.value_not_found current_module_name name_pre))
            in
            let name = Name.parens_if_infix name_pre in
            let subst_typ = Odoc_env.subst_type env type_expr in
            let v =
              {
                val_name = Name.concat current_module_name name ;
                val_info = comment_opt ;
                val_type = subst_typ ;
                val_recursive = false ;
                val_parameters = Odoc_value.dummy_parameter_list subst_typ ;
                val_code = None ;
                val_loc = { loc_impl = None ; loc_inter = Some (!file_name, pos_start_ele)}
              }
            in
            let (maybe_more, info_after_opt) =
              My_ir.just_after_special
                !file_name
                (get_string_of_file pos_end_ele pos_limit)
            in
            v.val_info <- merge_infos v.val_info info_after_opt ;
            (* update the parameter description *)
            Odoc_value.update_value_parameters_text v;

            let new_env = Odoc_env.add_value env v.val_name in
            (maybe_more, new_env, [ Element_value v ])

        | Parsetree.Psig_exception (name, exception_decl) ->
            let types_excep_decl =
              try Signature_search.search_exception table name
              with Not_found ->
                raise (Failure (Odoc_messages.exception_not_found current_module_name name))
            in
            let e =
              {
                ex_name = Name.concat current_module_name name ;
                ex_info = comment_opt ;
                ex_args = List.map (Odoc_env.subst_type env) types_excep_decl ;
                ex_alias = None ;
                ex_loc = { loc_impl = None ; loc_inter = Some (!file_name, pos_start_ele) } ;
                ex_code =
                   (
                    if !Odoc_args.keep_code then
                      Some (get_string_of_file pos_start_ele pos_end_ele)
                    else
                      None
                   ) ;
              }
            in
            let (maybe_more, info_after_opt) =
              My_ir.just_after_special
                !file_name
                (get_string_of_file pos_end_ele pos_limit)
            in
            e.ex_info <- merge_infos e.ex_info info_after_opt ;
            let new_env = Odoc_env.add_exception env e.ex_name in
            (maybe_more, new_env, [ Element_exception e ])

        | Parsetree.Psig_type name_type_decl_list ->
            (* we start by extending the environment *)
            let new_env =
              List.fold_left
                (fun acc_env -> fun (name, _) ->
                  let complete_name = Name.concat current_module_name name in
                  Odoc_env.add_type acc_env complete_name
                )
                env
                name_type_decl_list
            in
            let rec f ?(first=false) acc_maybe_more last_pos name_type_decl_list =
              match name_type_decl_list with
                [] ->
                  (acc_maybe_more, [])
              | (name, type_decl) :: q ->
                  let (assoc_com, ele_comments) =
                    if first then
                      (comment_opt, [])
                    else
                      get_comments_in_module
                        last_pos
                        type_decl.Parsetree.ptype_loc.Location.loc_start.Lexing.pos_cnum
                  in
                  let pos_limit2 =
                    match q with
                      [] -> pos_limit
                    | (_, td) :: _ -> td.Parsetree.ptype_loc.Location.loc_start.Lexing.pos_cnum
                  in
                  let (maybe_more, name_comment_list) =
                    name_comment_from_type_kind
                      type_decl.Parsetree.ptype_loc.Location.loc_end.Lexing.pos_cnum
                      pos_limit2
                      type_decl.Parsetree.ptype_kind
                  in
                  print_DEBUG ("Type "^name^" : "^(match assoc_com with None -> "sans commentaire" | Some c -> Odoc_misc.string_of_info c));
                  let f_DEBUG (name, c_opt) = print_DEBUG ("constructor/field "^name^": "^(match c_opt with None -> "sans commentaire" | Some c -> Odoc_misc.string_of_info c)) in
                  List.iter f_DEBUG name_comment_list;
                  (* get the information for the type in the signature *)
                  let sig_type_decl =
                    try Signature_search.search_type table name
                    with Not_found ->
                      raise (Failure (Odoc_messages.type_not_found current_module_name name))
                  in
                  (* get the type kind with the associated comments *)
                  let type_kind = get_type_kind new_env name_comment_list sig_type_decl.Types.type_kind in
                  let loc_start = type_decl.Parsetree.ptype_loc.Location.loc_start.Lexing.pos_cnum in
                  let new_end = type_decl.Parsetree.ptype_loc.Location.loc_end.Lexing.pos_cnum + maybe_more in
                  (* associate the comments to each constructor and build the [Type.t_type] *)
                  let new_type =
                    {
                      ty_name = Name.concat current_module_name name ;
                      ty_info = assoc_com ;
                      ty_parameters =
                        List.map2 (fun p (co,cn,_) ->
                                     (Odoc_env.subst_type new_env p,
                                      co, cn)
                                  )
                        sig_type_decl.Types.type_params
                        sig_type_decl.Types.type_variance;
                      ty_kind = type_kind ;
                      ty_manifest =
                      (match sig_type_decl.Types.type_manifest with
                        None -> None
                      | Some t -> Some (Odoc_env.subst_type new_env t));
                      ty_loc =
                      { loc_impl = None ;
                        loc_inter = Some (!file_name,loc_start) ;
                      };
                      ty_code =
                        (
                         if !Odoc_args.keep_code then
                           Some (get_string_of_file loc_start new_end)
                         else
                           None
                        ) ;
                    }
                  in
                  let (maybe_more2, info_after_opt) =
                    My_ir.just_after_special
                      !file_name
                      (get_string_of_file new_end pos_limit2)
                  in
                  new_type.ty_info <- merge_infos new_type.ty_info info_after_opt ;
                  let (new_maybe_more, eles) = f
                      (maybe_more + maybe_more2)
                      (new_end + maybe_more2)
                      q
                  in
                  (new_maybe_more, (ele_comments @ [Element_type new_type]) @ eles)
            in
            let (maybe_more, types) = f ~first: true 0 pos_start_ele name_type_decl_list in
            (maybe_more, new_env, types)

        | Parsetree.Psig_open _ -> (* A VOIR *)
            let ele_comments = match comment_opt with
              None -> []
            | Some i ->
                match i.i_desc with
                  None -> []
                | Some t -> [Element_module_comment t]
            in
            (0, env, ele_comments)

        | Parsetree.Psig_module (name, module_type) ->
            let complete_name = Name.concat current_module_name name in
            (* get the the module type in the signature by the module name *)
            let sig_module_type =
              try Signature_search.search_module table name
              with Not_found ->
                raise (Failure (Odoc_messages.module_not_found current_module_name name))
            in
            let module_kind = analyse_module_kind env complete_name module_type sig_module_type in
            let code_intf =
              if !Odoc_args.keep_code then
                let loc = module_type.Parsetree.pmty_loc in
                let st = loc.Location.loc_start.Lexing.pos_cnum in
                let en = loc.Location.loc_end.Lexing.pos_cnum in
                Some (get_string_of_file st en)
              else
                None
            in
            let new_module =
              {
                m_name = complete_name ;
                m_type = sig_module_type;
                m_info = comment_opt ;
                m_is_interface = true ;
                m_file = !file_name ;
                m_kind = module_kind ;
                m_loc = { loc_impl = None ; loc_inter = Some (!file_name, pos_start_ele) } ;
                m_top_deps = [] ;
                m_code = None ;
                m_code_intf = code_intf ;
                m_text_only = false ;
              }
            in
            let (maybe_more, info_after_opt) =
              My_ir.just_after_special
                !file_name
                (get_string_of_file pos_end_ele pos_limit)
            in
            new_module.m_info <- merge_infos new_module.m_info info_after_opt ;
            let new_env = Odoc_env.add_module env new_module.m_name in
            let new_env2 =
              match new_module.m_type with (* A VOIR : cela peut-il �tre Tmty_ident ? dans ce cas, on aurait pas la signature *)
                Types.Tmty_signature s -> Odoc_env.add_signature new_env new_module.m_name ~rel: (Name.simple new_module.m_name) s
              | _ -> new_env
            in
            (maybe_more, new_env2, [ Element_module new_module ])

        | Parsetree.Psig_recmodule decls ->
            (* we start by extending the environment *)
            let new_env =
              List.fold_left
                (fun acc_env -> fun (name, _) ->
                  let complete_name = Name.concat current_module_name name in
                  let e = Odoc_env.add_module acc_env complete_name in
                  (* get the information for the module in the signature *)
                  let sig_module_type =
                    try Signature_search.search_module table name
                    with Not_found ->
                      raise (Failure (Odoc_messages.module_not_found current_module_name name))
                  in
                  match sig_module_type with
                    (* A VOIR : cela peut-il �tre Tmty_ident ? dans ce cas, on aurait pas la signature *)
                    Types.Tmty_signature s ->
                      Odoc_env.add_signature e complete_name ~rel: name s
                  | _ ->
                      print_DEBUG "not a Tmty_signature";
                      e
                )
                env
                decls
            in
            let rec f ?(first=false) acc_maybe_more last_pos name_mtype_list =
              match name_mtype_list with
                [] ->
                  (acc_maybe_more, [])
              | (name, modtype) :: q ->
                  let complete_name = Name.concat current_module_name name in
                  let loc_start = modtype.Parsetree.pmty_loc.Location.loc_start.Lexing.pos_cnum in
                  let loc_end = modtype.Parsetree.pmty_loc.Location.loc_end.Lexing.pos_cnum in
                  let (assoc_com, ele_comments) =
                    if first then
                      (comment_opt, [])
                    else
                      get_comments_in_module
                        last_pos
                        loc_start
                  in
                  let pos_limit2 =
                    match q with
                      [] -> pos_limit
                    | (_, mty) :: _ -> mty.Parsetree.pmty_loc.Location.loc_start.Lexing.pos_cnum
                  in
                  (* get the information for the module in the signature *)
                  let sig_module_type =
                    try Signature_search.search_module table name
                    with Not_found ->
                      raise (Failure (Odoc_messages.module_not_found current_module_name name))
                  in
                  (* associate the comments to each constructor and build the [Type.t_type] *)
                  let module_kind = analyse_module_kind new_env complete_name modtype sig_module_type in
                  let code_intf =
                    if !Odoc_args.keep_code then
                      let loc = modtype.Parsetree.pmty_loc in
                      let st = loc.Location.loc_start.Lexing.pos_cnum in
                      let en = loc.Location.loc_end.Lexing.pos_cnum in
                      Some (get_string_of_file st en)
                    else
                      None
                  in
                  let new_module =
                    {
                      m_name = complete_name ;
                      m_type = sig_module_type;
                      m_info = assoc_com ;
                      m_is_interface = true ;
                      m_file = !file_name ;
                      m_kind = module_kind ;
                      m_loc = { loc_impl = None ; loc_inter = Some (!file_name, pos_start_ele) } ;
                      m_top_deps = [] ;
                      m_code = None ;
                      m_code_intf = code_intf ;
                      m_text_only = false ;
                    }
                  in
                  let (maybe_more, info_after_opt) =
                    My_ir.just_after_special
                      !file_name
                      (get_string_of_file loc_end pos_limit2)
                  in
                  new_module.m_info <- merge_infos new_module.m_info info_after_opt ;

                  let (maybe_more2, eles) = f
                      maybe_more
                      (loc_end + maybe_more)
                      q
                  in
                  (maybe_more2, (ele_comments @ [Element_module new_module]) @ eles)
            in
            let (maybe_more, mods) = f ~first: true 0 pos_start_ele decls in
            (maybe_more, new_env, mods)

        | Parsetree.Psig_modtype (name, Parsetree.Pmodtype_abstract) ->
            let sig_mtype =
              try Signature_search.search_module_type table name
              with Not_found ->
                raise (Failure (Odoc_messages.module_type_not_found current_module_name name))
            in
            let complete_name = Name.concat current_module_name name in
            let mt =
              {
                mt_name = complete_name ;
                mt_info = comment_opt ;
                mt_type = sig_mtype ;
                mt_is_interface = true ;
                mt_file = !file_name ;
                mt_kind = None ;
                mt_loc = { loc_impl = None ; loc_inter = Some (!file_name, pos_start_ele) } ;
              }
            in
            let (maybe_more, info_after_opt) =
              My_ir.just_after_special
                !file_name
                (get_string_of_file pos_end_ele pos_limit)
            in
            mt.mt_info <- merge_infos mt.mt_info info_after_opt ;
            let new_env = Odoc_env.add_module_type env mt.mt_name in
            (maybe_more, new_env, [ Element_module_type mt ])

        | Parsetree.Psig_modtype (name, Parsetree.Pmodtype_manifest module_type) ->
            let complete_name = Name.concat current_module_name name in
            let sig_mtype_opt =
              try Signature_search.search_module_type table name
              with Not_found ->
                raise (Failure (Odoc_messages.module_type_not_found current_module_name name))
            in
            let module_type_kind =
              match sig_mtype_opt with
              | Some sig_mtype -> Some (analyse_module_type_kind env complete_name module_type sig_mtype)
              | None -> None
            in
            let mt =
              {
                mt_name = complete_name ;
                mt_info = comment_opt ;
                mt_type = sig_mtype_opt ;
                mt_is_interface = true ;
                mt_file = !file_name ;
                mt_kind = module_type_kind ;
                mt_loc = { loc_impl = None ; loc_inter = Some (!file_name, pos_start_ele) } ;
              }
            in
            let (maybe_more, info_after_opt) =
              My_ir.just_after_special
                !file_name
                (get_string_of_file pos_end_ele pos_limit)
            in
            mt.mt_info <- merge_infos mt.mt_info info_after_opt ;
            let new_env = Odoc_env.add_module_type env mt.mt_name in
            let new_env2 =
              match sig_mtype_opt with (* A VOIR : cela peut-il �tre Tmty_ident ? dans ce cas, on aurait pas la signature *)
                Some (Types.Tmty_signature s) -> Odoc_env.add_signature new_env mt.mt_name ~rel: (Name.simple mt.mt_name) s
              | _ -> new_env
            in
            (maybe_more, new_env2, [ Element_module_type mt ])

        | Parsetree.Psig_include module_type ->
            let rec f = function
                Parsetree.Pmty_ident longident ->
                  Name.from_longident longident
              | Parsetree.Pmty_signature _ ->
                  "??"
              | Parsetree.Pmty_functor _ ->
                  "??"
              | Parsetree.Pmty_with (mt, _) ->
                  f mt.Parsetree.pmty_desc
            in
            let name = (f module_type.Parsetree.pmty_desc) in
            let full_name = Odoc_env.full_module_or_module_type_name env name in
            let im =
              {
                im_name = full_name ;
                im_module = None ;
                im_info = comment_opt;
              }
            in
            (0, env, [ Element_included_module im ]) (* A VOIR : �tendre l'environnement ? avec quoi ? *)

        | Parsetree.Psig_class class_description_list ->
            (* we start by extending the environment *)
            let new_env =
              List.fold_left
                (fun acc_env -> fun class_desc ->
                  let complete_name = Name.concat current_module_name class_desc.Parsetree.pci_name in
                  Odoc_env.add_class acc_env complete_name
                )
                env
                class_description_list
            in
            let rec f ?(first=false) acc_maybe_more last_pos class_description_list =
              match class_description_list with
                [] ->
                  (acc_maybe_more, [])
              | class_desc :: q ->
                  let (assoc_com, ele_comments) =
                    if first then
                      (comment_opt, [])
                    else
                      get_comments_in_module
                        last_pos
                        class_desc.Parsetree.pci_loc.Location.loc_start.Lexing.pos_cnum
                  in
                  let pos_end = class_desc.Parsetree.pci_loc.Location.loc_end.Lexing.pos_cnum in
                  let pos_limit2 =
                    match q with
                      [] -> pos_limit
                    | cd :: _ -> cd.Parsetree.pci_loc.Location.loc_start.Lexing.pos_cnum
                  in
                  let name = class_desc.Parsetree.pci_name in
                  let complete_name = Name.concat current_module_name name in
                  let sig_class_decl =
                    try Signature_search.search_class table name
                    with Not_found ->
                      raise (Failure (Odoc_messages.class_not_found current_module_name name))
                  in
                  let sig_class_type = sig_class_decl.Types.cty_type in
                  let (parameters, class_kind) =
                    analyse_class_kind
                     new_env
                     complete_name
                     class_desc.Parsetree.pci_loc.Location.loc_start.Lexing.pos_cnum
                     class_desc.Parsetree.pci_expr
                     sig_class_type
                 in
                 let new_class =
                   {
                     cl_name = complete_name ;
                     cl_info = assoc_com ;
                     cl_type = Odoc_env.subst_class_type env sig_class_type ;
                     cl_type_parameters = sig_class_decl.Types.cty_params;
                     cl_virtual = class_desc.Parsetree.pci_virt = Asttypes.Virtual ;
                     cl_kind = class_kind ;
                     cl_parameters = parameters ;
                     cl_loc = { loc_impl = None ; loc_inter = Some (!file_name, pos_start_ele) } ;
                   }
                 in
                 let (maybe_more, info_after_opt) =
                   My_ir.just_after_special
                     !file_name
                     (get_string_of_file pos_end pos_limit2)
                 in
                 new_class.cl_info <- merge_infos new_class.cl_info info_after_opt ;
                 Odoc_class.class_update_parameters_text new_class ;
                 let (new_maybe_more, eles) =
                   f maybe_more (pos_end + maybe_more) q
                 in
                 (new_maybe_more,
                  ele_comments @ (( Element_class new_class ) :: eles))
            in
            let (maybe_more, eles) =
              f ~first: true 0 pos_start_ele class_description_list
            in
            (maybe_more, new_env, eles)

        | Parsetree.Psig_class_type class_type_declaration_list ->
            (* we start by extending the environment *)
            let new_env =
              List.fold_left
                (fun acc_env -> fun class_type_decl ->
                  let complete_name = Name.concat current_module_name class_type_decl.Parsetree.pci_name in
                  Odoc_env.add_class_type acc_env complete_name
                )
                env
                class_type_declaration_list
            in
            let rec f ?(first=false) acc_maybe_more last_pos class_type_description_list =
              match class_type_description_list with
                [] ->
                  (acc_maybe_more, [])
              | ct_decl :: q ->
                  let (assoc_com, ele_comments) =
                    if first then
                      (comment_opt, [])
                    else
                      get_comments_in_module
                        last_pos
                        ct_decl.Parsetree.pci_loc.Location.loc_start.Lexing.pos_cnum
                  in
                  let pos_end = ct_decl.Parsetree.pci_loc.Location.loc_end.Lexing.pos_cnum in
                  let pos_limit2 =
                    match q with
                      [] -> pos_limit
                    | ct_decl2 :: _ -> ct_decl2.Parsetree.pci_loc.Location.loc_start.Lexing.pos_cnum
                  in
                  let name = ct_decl.Parsetree.pci_name in
                  let complete_name = Name.concat current_module_name name in
                  let sig_cltype_decl =
                    try Signature_search.search_class_type table name
                    with Not_found ->
                      raise (Failure (Odoc_messages.class_type_not_found current_module_name name))
                  in
                  let sig_class_type = sig_cltype_decl.Types.clty_type in
                  let kind = analyse_class_type_kind
                      new_env
                      complete_name
                      ct_decl.Parsetree.pci_loc.Location.loc_start.Lexing.pos_cnum
                      ct_decl.Parsetree.pci_expr
                      sig_class_type
                  in
                  let ct =
                    {
                      clt_name = complete_name ;
                      clt_info = assoc_com ;
                      clt_type = Odoc_env.subst_class_type env sig_class_type ;
                      clt_type_parameters = sig_cltype_decl.clty_params ;
                      clt_virtual = ct_decl.Parsetree.pci_virt = Asttypes.Virtual ;
                      clt_kind = kind ;
                      clt_loc = { loc_impl = None ; loc_inter = Some (!file_name, pos_start_ele) } ;
                    }
                  in
                  let (maybe_more, info_after_opt) =
                    My_ir.just_after_special
                      !file_name
                      (get_string_of_file pos_end pos_limit2)
                  in
                  ct.clt_info <- merge_infos ct.clt_info info_after_opt ;
                  let (new_maybe_more, eles) =
                    f maybe_more (pos_end + maybe_more) q
                  in
                 (new_maybe_more,
                  ele_comments @ (( Element_class_type ct) :: eles))
            in
            let (maybe_more, eles) =
              f ~first: true 0 pos_start_ele class_type_declaration_list
            in
            (maybe_more, new_env, eles)

    (** Return a module_type_kind from a Parsetree.module_type and a Types.module_type *)
    and analyse_module_type_kind env current_module_name module_type sig_module_type =
      match module_type.Parsetree.pmty_desc with
        Parsetree.Pmty_ident longident ->
          let name =
            match sig_module_type with
              Types.Tmty_ident path -> Name.from_path path
            | _ -> Name.from_longident longident
              (* A VOIR cela arrive quand on fait module type F : functor ... -> Toto, Toto n'est pas un ident mais une structure *)
          in
          Module_type_alias { mta_name = Odoc_env.full_module_type_name env name ;
                              mta_module = None }

      | Parsetree.Pmty_signature ast ->
          (
           (* we must have a signature in the module type *)
           match sig_module_type with
             Types.Tmty_signature signat ->
               let pos_start = module_type.Parsetree.pmty_loc.Location.loc_start.Lexing.pos_cnum in
               let pos_end = module_type.Parsetree.pmty_loc.Location.loc_end.Lexing.pos_cnum in
               let elements = analyse_parsetree env signat current_module_name pos_start pos_end ast in
               Module_type_struct elements
           | _ ->
               raise (Failure "Parsetree.Pmty_signature signature but not Types.Tmty_signature signat")
          )

      | Parsetree.Pmty_functor (_,pmodule_type2, module_type2) ->
          (
           let loc_start = pmodule_type2.Parsetree.pmty_loc.Location.loc_start.Lexing.pos_cnum in
           let loc_end = pmodule_type2.Parsetree.pmty_loc.Location.loc_end.Lexing.pos_cnum in
           let mp_type_code = get_string_of_file loc_start loc_end in
           print_DEBUG (Printf.sprintf "mp_type_code=%s" mp_type_code);
           match sig_module_type with
             Types.Tmty_functor (ident, param_module_type, body_module_type) ->
               let mp_kind = analyse_module_type_kind env
                   current_module_name pmodule_type2 param_module_type
               in
               let param =
                 {
                   mp_name = Name.from_ident ident ;
                   mp_type = Odoc_env.subst_module_type env param_module_type ;
                   mp_type_code = mp_type_code ;
                   mp_kind = mp_kind ;
                 }
               in
               let k = analyse_module_type_kind env
                   current_module_name
                   module_type2
                   body_module_type
               in
               Module_type_functor (param, k)

           | _ ->
               (* if we're here something's wrong *)
               raise (Failure "Parsetree.Pmty_functor _ but not Types.Tmty_functor _")
          )

      | Parsetree.Pmty_with (module_type2, _) ->
          (* of module_type * (Longident.t * with_constraint) list *)
          (
           let loc_start = module_type2.Parsetree.pmty_loc.Location.loc_end.Lexing.pos_cnum in
           let loc_end = module_type.Parsetree.pmty_loc.Location.loc_end.Lexing.pos_cnum in
           let s = get_string_of_file loc_start loc_end in
           let k = analyse_module_type_kind env current_module_name module_type2 sig_module_type in
           Module_type_with (k, s)
          )

    (** Analyse of a Parsetree.module_type and a Types.module_type.*)
    and analyse_module_kind env current_module_name module_type sig_module_type =
      match module_type.Parsetree.pmty_desc with
        Parsetree.Pmty_ident longident ->
          let k = analyse_module_type_kind env current_module_name module_type sig_module_type in
          Module_with ( k, "" )

      | Parsetree.Pmty_signature signature ->
          (
           match sig_module_type with
             Types.Tmty_signature signat ->
               Module_struct
                 (analyse_parsetree
                    env
                    signat
                    current_module_name
                    module_type.Parsetree.pmty_loc.Location.loc_start.Lexing.pos_cnum
                    module_type.Parsetree.pmty_loc.Location.loc_end.Lexing.pos_cnum
                    signature
                 )
           | _ ->
               (* if we're here something's wrong *)
               raise (Failure "Parsetree.Pmty_signature signature but not Types.Tmty_signature signat")
          )
      | Parsetree.Pmty_functor (_,pmodule_type2,module_type2) (* of string * module_type * module_type *) ->
          (
           match sig_module_type with
             Types.Tmty_functor (ident, param_module_type, body_module_type) ->
               let loc_start = pmodule_type2.Parsetree.pmty_loc.Location.loc_start.Lexing.pos_cnum in
               let loc_end = pmodule_type2.Parsetree.pmty_loc.Location.loc_end.Lexing.pos_cnum in
               let mp_type_code = get_string_of_file loc_start loc_end in
               print_DEBUG (Printf.sprintf "mp_type_code=%s" mp_type_code);
               let mp_kind = analyse_module_type_kind env
                   current_module_name pmodule_type2 param_module_type
               in
               let param =
                 {
                   mp_name = Name.from_ident ident ;
                   mp_type = Odoc_env.subst_module_type env param_module_type ;
                   mp_type_code = mp_type_code ;
                   mp_kind = mp_kind ;
                 }
               in
               let k = analyse_module_kind env
                   current_module_name
                   module_type2
                   body_module_type
               in
               Module_functor (param, k)

           | _ ->
               (* if we're here something's wrong *)
               raise (Failure "Parsetree.Pmty_functor _ but not Types.Tmty_functor _")
          )
      | Parsetree.Pmty_with (module_type2, _) ->
          (*of module_type * (Longident.t * with_constraint) list*)
          (
           let loc_start = module_type2.Parsetree.pmty_loc.Location.loc_end.Lexing.pos_cnum in
           let loc_end = module_type.Parsetree.pmty_loc.Location.loc_end.Lexing.pos_cnum in
           let s = get_string_of_file loc_start loc_end in
           let k = analyse_module_type_kind env current_module_name module_type2 sig_module_type in
           Module_with (k, s)
          )

    (** Analyse of a Parsetree.class_type and a Types.class_type to return a couple
       (class parameters, class_kind).*)
    and analyse_class_kind env current_class_name last_pos parse_class_type sig_class_type =
      match parse_class_type.Parsetree.pcty_desc, sig_class_type with
        (Parsetree.Pcty_constr (_, _) (*of Longident.t * core_type list *),
         Types.Tcty_constr (p, typ_list, _) (*of Path.t * type_expr list * class_type*)) ->
          print_DEBUG "Tcty_constr _";
           let path_name = Name.from_path p in
           let name = Odoc_env.full_class_or_class_type_name env path_name in
           let k =
             Class_constr
               {
                 cco_name = name ;
                 cco_class = None ;
                 cco_type_parameters = List.map (Odoc_env.subst_type env) typ_list
               }
           in
           ([], k)

      | (Parsetree.Pcty_signature (_, class_type_field_list), Types.Tcty_signature class_signature) ->
          print_DEBUG "Types.Tcty_signature class_signature";
          let f_DEBUG var (mutable_flag, type_exp) = print_DEBUG var in
          Types.Vars.iter f_DEBUG class_signature.Types.cty_vars;
          print_DEBUG ("Type de la classe "^current_class_name^" : ");
          print_DEBUG (Odoc_print.string_of_type_expr class_signature.Types.cty_self);
          (* we get the elements of the class in class_type_field_list *)
          let (inher_l, ele) = analyse_class_elements env current_class_name
              last_pos
              parse_class_type.Parsetree.pcty_loc.Location.loc_end.Lexing.pos_cnum
              class_type_field_list
              class_signature
          in
          ([], Class_structure (inher_l, ele))

      | (Parsetree.Pcty_fun (parse_label, _, pclass_type), Types.Tcty_fun (label, type_expr, class_type)) ->
          (* label = string. Dans les signatures, pas de nom de param�tres � l'int�rieur des tuples *)
          (* si label = "", pas de label. ici on a l'information pour savoir si on a un label explicite. *)
          if parse_label = label then
            (
             let new_param = Simple_name
                 {
                   sn_name = Btype.label_name label ;
                   sn_type = Odoc_env.subst_type env type_expr ;
                   sn_text = None ; (* will be updated when the class will be created *)
                 }
             in
             let (l, k) = analyse_class_kind env current_class_name last_pos pclass_type class_type in
             ( (new_param :: l), k )
            )
          else
            (
             raise (Failure "Parsetree.Pcty_fun (parse_label, _, pclass_type), labels diff�rents")
            )

      | _ ->
          raise (Failure "analyse_class_kind pas de correspondance dans le match")

    (** Analyse of a Parsetree.class_type and a Types.class_type to return a class_type_kind.*)
    and analyse_class_type_kind env current_class_name last_pos parse_class_type sig_class_type =
      match parse_class_type.Parsetree.pcty_desc, sig_class_type with
        (Parsetree.Pcty_constr (_, _) (*of Longident.t * core_type list *),
         Types.Tcty_constr (p, typ_list, _) (*of Path.t * type_expr list * class_type*)) ->
          print_DEBUG "Tcty_constr _";
           let k =
             Class_type
               {
                 cta_name = Odoc_env.full_class_or_class_type_name env (Name.from_path p) ;
                 cta_class = None ;
                 cta_type_parameters = List.map (Odoc_env.subst_type env) typ_list
               }
           in
           k

      | (Parsetree.Pcty_signature (_, class_type_field_list), Types.Tcty_signature class_signature) ->
          print_DEBUG "Types.Tcty_signature class_signature";
          let f_DEBUG var (mutable_flag, type_exp) = print_DEBUG var in
          Types.Vars.iter f_DEBUG class_signature.Types.cty_vars;
          print_DEBUG ("Type de la classe "^current_class_name^" : ");
          print_DEBUG (Odoc_print.string_of_type_expr class_signature.Types.cty_self);
          (* we get the elements of the class in class_type_field_list *)
          let (inher_l, ele) = analyse_class_elements env current_class_name
              last_pos
              parse_class_type.Parsetree.pcty_loc.Location.loc_end.Lexing.pos_cnum
              class_type_field_list
              class_signature
          in
          Class_signature (inher_l, ele)

      | (Parsetree.Pcty_fun (parse_label, _, pclass_type), Types.Tcty_fun (label, type_expr, class_type)) ->
          raise (Failure "analyse_class_type_kind : Parsetree.Pcty_fun (...) with Types.Tcty_fun (...)")
(*
      | (Parsetree.Pcty_constr (longident, _) (*of Longident.t * core_type list *),
         Types.Tcty_signature class_signature) ->
           (* A VOIR : c'est pour le cas des contraintes de classes :
              class type cons = object
                method m : int
              end

              class ['a] maxou x =
                (object
                  val a = (x : 'a)
                  method m = a
                end : cons )
                    ^^^^^^
           *)
           let k =
             Class_type
               {
                 cta_name = Odoc_env.full_class_name env (Name.from_longident longident) ;
                 cta_class = None ;
                 cta_type_parameters = List.map (Odoc_env.subst_type env) typ_list (* ?? *)
               }
           in
           ([], k)
*)
      | _ ->
          raise (Failure "analyse_class_type_kind pas de correspondance dans le match")

    let analyse_signature source_file input_file
        (ast : Parsetree.signature) (signat : Types.signature) =
      let complete_source_file =
        try
          let curdir = Sys.getcwd () in
          let (dirname, basename) = (Filename.dirname source_file, Filename.basename source_file) in
          Sys.chdir dirname ;
          let complete = Filename.concat (Sys.getcwd ()) basename in
          Sys.chdir curdir ;
          complete
        with
          Sys_error s ->
            prerr_endline s ;
            incr Odoc_global.errors ;
            source_file
      in
      prepare_file complete_source_file input_file;
      (* We create the t_module for this file. *)
      let mod_name = String.capitalize
          (Filename.basename (try Filename.chop_extension source_file with _ -> source_file))
      in
      let (len,info_opt) = My_ir.first_special !file_name !file in
      let elements =
        analyse_parsetree Odoc_env.empty signat mod_name len (String.length !file) ast
      in
      let code_intf =
        if !Odoc_args.keep_code then
          Some !file
        else
          None
      in
      {
        m_name = mod_name ;
        m_type = Types.Tmty_signature signat ;
        m_info = info_opt ;
        m_is_interface = true ;
        m_file = !file_name ;
        m_kind = Module_struct elements ;
        m_loc = { loc_impl = None ; loc_inter = Some (!file_name, 0) } ;
        m_top_deps = [] ;
        m_code = None ;
        m_code_intf = code_intf ;
        m_text_only = false ;
      }

    end
