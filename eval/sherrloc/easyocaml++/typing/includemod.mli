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

(* $Id: includemod.mli,v 1.13 2006/09/20 11:14:37 doligez Exp $ *)

(* Inclusion checks for the module language *)

open Types
open Typedtree
open Format

val modtypes: Env.t -> module_type -> module_type -> module_coercion
val signatures: Env.t -> signature -> signature -> module_coercion
val compunit: string -> signature -> string -> signature -> module_coercion
val type_declarations:
      Env.t -> Ident.t -> type_declaration -> type_declaration -> unit

type error =
    Missing_field of Ident.t
  | Value_descriptions of Ident.t * value_description * value_description
  | Type_declarations of Ident.t * type_declaration * type_declaration
  | Exception_declarations of
      Ident.t * exception_declaration * exception_declaration
  | Module_types of module_type * module_type
  | Modtype_infos of Ident.t * modtype_declaration * modtype_declaration
  | Modtype_permutation
  | Interface_mismatch of string * string
  | Class_type_declarations of
      Ident.t * cltype_declaration * cltype_declaration *
      Ctype.class_match_failure list
  | Class_declarations of
      Ident.t * class_declaration * class_declaration *
      Ctype.class_match_failure list
  | Unbound_modtype_path of Path.t

exception Error of error list

val report_error: formatter -> error list -> unit
