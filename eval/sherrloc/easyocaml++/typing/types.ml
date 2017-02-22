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

(* $Id: types.ml,v 1.26.8.1 2007/06/08 08:03:16 garrigue Exp $ *)

(* Representation of types and declarations *)

open Misc
open Asttypes

(* Type expressions for the core language *)

type type_expr =
  { mutable desc: type_desc; 
    mutable level: int;
    mutable id: int }

and type_desc =
    Tvar
  | Tarrow of label * type_expr * type_expr * commutable
  | Ttuple of type_expr list
  | Tconstr of Path.t * type_expr list * abbrev_memo ref
  | Tobject of type_expr * (Path.t * type_expr list) option ref
  | Tfield of string * field_kind * type_expr * type_expr
  | Tnil
  | Tlink of type_expr
  | Tsubst of type_expr
  | Tvariant of row_desc
  | Tunivar
  | Tpoly of type_expr * type_expr list

and row_desc =
    { row_fields: (label * row_field) list;
      row_more: type_expr;
      row_bound: unit;
      row_closed: bool;
      row_fixed: bool;
      row_name: (Path.t * type_expr list) option }

and row_field =
    Rpresent of type_expr option
  | Reither of bool * type_expr list * bool * row_field option ref
  | Rabsent

and abbrev_memo =
    Mnil
  | Mcons of Path.t * type_expr * type_expr * abbrev_memo
  | Mlink of abbrev_memo ref

and field_kind =
    Fvar of field_kind option ref
  | Fpresent
  | Fabsent

and commutable =
    Cok
  | Cunknown
  | Clink of commutable ref

module TypeOps = struct
  type t = type_expr
  let compare t1 t2 = t1.id - t2.id
  let hash t = t.id
  let equal t1 t2 = t1 == t2
end

(* Maps of methods and instance variables *)

module OrderedString = struct type t = string let compare = compare end
module Meths = Map.Make(OrderedString)
module Vars = Meths

(* Value descriptions *)

type value_description =
  { val_type: type_expr;                (* Type of the value *)
    val_kind: value_kind }

and value_kind =
    Val_reg                             (* Regular value *)
  | Val_prim of Primitive.description   (* Primitive *)
  | Val_ivar of mutable_flag * string   (* Instance variable (mutable ?) *)
  | Val_self of (Ident.t * type_expr) Meths.t ref *
                (Ident.t * Asttypes.mutable_flag *
                 Asttypes.virtual_flag * type_expr) Vars.t ref *
                string * type_expr
                                        (* Self *)
  | Val_anc of (string * Ident.t) list * string
                                        (* Ancestor *)
  | Val_unbound                         (* Unbound variable *)

(* Constructor descriptions *)

type constructor_description =
  { cstr_res: type_expr;                (* Type of the result *)
    cstr_args: type_expr list;          (* Type of the arguments *)
    cstr_arity: int;                    (* Number of arguments *)
    cstr_tag: constructor_tag;          (* Tag for heap blocks *)
    cstr_consts: int;                   (* Number of constant constructors *)
    cstr_nonconsts: int;                (* Number of non-const constructors *)
    cstr_private: private_flag }        (* Read-only constructor? *)

and constructor_tag =
    Cstr_constant of int                (* Constant constructor (an int) *)
  | Cstr_block of int                   (* Regular constructor (a block) *)
  | Cstr_exception of Path.t            (* Exception constructor *)

(* Record label descriptions *)

type label_description =
  { lbl_res: type_expr;                 (* Type of the result *)
    lbl_arg: type_expr;                 (* Type of the argument *)
    lbl_mut: mutable_flag;              (* Is this a mutable field? *)
    lbl_pos: int;                       (* Position in block *)
    lbl_all: label_description array;   (* All the labels in this type *)
    lbl_repres: record_representation;  (* Representation for this record *)
    lbl_private: private_flag }         (* Read-only field? *)

and record_representation =
    Record_regular                      (* All fields are boxed / tagged *)
  | Record_float                        (* All fields are floats *)

(* Type definitions *)

type type_declaration =
  { type_params: type_expr list;
    type_arity: int;
    type_kind: type_kind;
    type_manifest: type_expr option;
    type_variance: (bool * bool * bool) list }

and type_kind =
    Type_abstract
  | Type_variant of (string * type_expr list) list * private_flag
  | Type_record of (string * mutable_flag * type_expr) list
                 * record_representation * private_flag

type exception_declaration = type_expr list

(* Type expressions for the class language *)

module Concr = Set.Make(OrderedString)

type class_type =
    Tcty_constr of Path.t * type_expr list * class_type
  | Tcty_signature of class_signature
  | Tcty_fun of label * type_expr * class_type

and class_signature =
  { cty_self: type_expr;
    cty_vars:
      (Asttypes.mutable_flag * Asttypes.virtual_flag * type_expr) Vars.t;
    cty_concr: Concr.t;
    cty_inher: (Path.t * type_expr list) list }

type class_declaration =
  { cty_params: type_expr list;
    mutable cty_type: class_type;
    cty_path: Path.t;
    cty_new: type_expr option;
    cty_variance: (bool * bool) list }

type cltype_declaration =
  { clty_params: type_expr list;
    clty_type: class_type;
    clty_path: Path.t;
    clty_variance: (bool * bool) list }

(* Type expressions for the module language *)

type module_type =
    Tmty_ident of Path.t
  | Tmty_signature of signature
  | Tmty_functor of Ident.t * module_type * module_type

and signature = signature_item list

and signature_item =
    Tsig_value of Ident.t * value_description
  | Tsig_type of Ident.t * type_declaration * rec_status
  | Tsig_exception of Ident.t * exception_declaration
  | Tsig_module of Ident.t * module_type * rec_status
  | Tsig_modtype of Ident.t * modtype_declaration
  | Tsig_class of Ident.t * class_declaration * rec_status
  | Tsig_cltype of Ident.t * cltype_declaration * rec_status

and modtype_declaration =
    Tmodtype_abstract
  | Tmodtype_manifest of module_type

and rec_status =
    Trec_not
  | Trec_first
  | Trec_next
