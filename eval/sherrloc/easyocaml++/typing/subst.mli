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

(* $Id: subst.mli,v 1.12.36.1 2007/12/26 16:00:41 xleroy Exp $ *)

(* Substitutions *)

open Types

type t

(*
   Substitutions are used to translate a type from one context to
   another.  This requires substituing paths for identifiers, and
   possibly also lowering the level of non-generic variables so that
   it be inferior to the maximum level of the new context.

   Substitutions can also be used to create a "clean" copy of a type.
   Indeed, non-variable node of a type are duplicated, with their
   levels set to generic level.  That way, the resulting type is
   well-formed (decreasing levels), even if the original one was not.
*)

val identity: t

val add_type: Ident.t -> Path.t -> t -> t
val add_module: Ident.t -> Path.t -> t -> t
val add_modtype: Ident.t -> module_type -> t -> t
val for_saving: t -> t
val reset_for_saving: unit -> unit

val module_path: t -> Path.t -> Path.t
val type_path: t -> Path.t -> Path.t

val type_expr: t -> type_expr -> type_expr
val class_type: t -> class_type -> class_type
val value_description: t -> value_description -> value_description
val type_declaration: t -> type_declaration -> type_declaration
val exception_declaration:
        t -> exception_declaration -> exception_declaration
val class_declaration: t -> class_declaration -> class_declaration
val cltype_declaration: t -> cltype_declaration -> cltype_declaration
val modtype: t -> module_type -> module_type
val signature: t -> signature -> signature
val modtype_declaration: t -> modtype_declaration -> modtype_declaration
