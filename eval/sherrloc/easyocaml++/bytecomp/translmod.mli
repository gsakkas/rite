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

(* $Id: translmod.mli,v 1.12 2004/04/09 13:32:27 xleroy Exp $ *)

(* Translation from typed abstract syntax to lambda terms,
   for the module language *)

open Typedtree
open Lambda

val transl_implementation: string -> structure * module_coercion -> lambda
val transl_store_implementation:
      string -> structure * module_coercion -> int * lambda
val transl_toplevel_definition: structure -> lambda
val transl_package: 
      Ident.t option list -> Ident.t -> module_coercion -> lambda
val transl_store_package:
      Ident.t option list -> Ident.t -> module_coercion -> int * lambda

val toplevel_name: Ident.t -> string

val primitive_declarations: string list ref

type error =
  Circular_dependency of Ident.t

exception Error of Location.t * error

val report_error: Format.formatter -> error -> unit
