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

(* $Id: odoc_type.ml,v 1.5 2003/11/24 10:44:07 starynke Exp $ *)

(** Representation and manipulation of a type, but not class nor module type.*)

module Name = Odoc_name

(** Description of a variant type constructor. *)
type variant_constructor = {
    vc_name : string ;
    vc_args : Types.type_expr list ; (** arguments of the constructor *)
    mutable vc_text : Odoc_types.text option ; (** optional user description *)
  } 

(** Description of a record type field. *)
type record_field = {
    rf_name : string ;
    rf_mutable : bool ; (** true if mutable *)
    rf_type : Types.type_expr ;
    mutable rf_text : Odoc_types.text option ; (** optional user description *)
  } 

(** The various kinds of type. *)
type type_kind = 
    Type_abstract
  | Type_variant of variant_constructor list * bool
                   (** constructors * bool *)
  | Type_record of record_field list * bool
	           (** fields * bool *)

(** Representation of a type. *)
type t_type = {
    ty_name : Name.t ;
    mutable ty_info : Odoc_types.info option ; (** optional user information *)
    ty_parameters : (Types.type_expr * bool * bool) list ; 
                    (** type parameters: (type, covariant, contravariant) *)
    ty_kind : type_kind ;
    ty_manifest : Types.type_expr option; (** type manifest *)
    mutable ty_loc : Odoc_types.location ;
    mutable ty_code : string option;
  } 

