(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*            Xavier Leroy, projet Cristal, INRIA Rocquencourt         *)
(*                                                                     *)
(*  Copyright 2002 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: bytepackager.mli,v 1.1 2002/02/08 16:55:42 xleroy Exp $ *)

(* "Package" a set of .cmo files into one .cmo file having the
   original compilation units as sub-modules. *)

val package_files: string list -> string -> unit

type error =
    Forward_reference of string * Ident.t
  | Multiple_definition of string * Ident.t
  | Not_an_object_file of string
  | Illegal_renaming of string * string
  | File_not_found of string

exception Error of error

val report_error: Format.formatter -> error -> unit
