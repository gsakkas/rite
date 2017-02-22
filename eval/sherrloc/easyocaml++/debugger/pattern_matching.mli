(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*          Jerome Vouillon, projet Cristal, INRIA Rocquencourt        *)
(*          Objective Caml port by John Malecki and Xavier Leroy       *)
(*                                                                     *)
(*  Copyright 1996 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: pattern_matching.mli,v 1.2 1999/11/17 18:57:26 xleroy Exp $ *)

(************************ Simple pattern matching **********************)

open Parser_aux

val pattern_matching :
  pattern -> Debugcom.remote_value -> Typedtree.type_expr -> (string * Debugcom.remote_value * Typedtree.type_expr) list;;
