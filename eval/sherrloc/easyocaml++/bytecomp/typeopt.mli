(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*            Xavier Leroy, projet Cristal, INRIA Rocquencourt         *)
(*                                                                     *)
(*  Copyright 1998 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: typeopt.mli,v 1.4 2000/02/28 15:45:50 xleroy Exp $ *)

(* Auxiliaries for type-based optimizations, e.g. array kinds *)

val has_base_type : Typedtree.expression -> Path.t -> bool
val maybe_pointer : Typedtree.expression -> bool
val array_kind : Typedtree.expression -> Lambda.array_kind
val array_pattern_kind : Typedtree.pattern -> Lambda.array_kind
val bigarray_kind_and_layout :
      Typedtree.expression -> Lambda.bigarray_kind * Lambda.bigarray_layout
