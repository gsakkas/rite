(***********************************************************************)
(*                             ocamlbuild                              *)
(*                                                                     *)
(*  Nicolas Pouillard, Berke Durak, projet Gallium, INRIA Rocquencourt *)
(*                                                                     *)
(*  Copyright 2007 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: glob.mli,v 1.1.4.1 2007/11/21 21:02:05 ertai Exp $ *)
(* Original author: Berke Durak *)
(* Glob *)

(** The type representing fast patterns.  Do not attempt to compare them, as they get on-the-fly optimizations. *)
type fast_pattern

(** A self-contained module implementing extended shell glob patterns who have an expressive power
    equal to boolean combinations of regular expressions.  *)
include Signatures.GLOB with type globber = fast_pattern Glob_ast.atom Bool.boolean

val fast_pattern_of_pattern : Glob_ast.pattern -> fast_pattern
