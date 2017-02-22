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

(* $Id: printlinear.mli,v 1.5 2000/04/21 08:10:35 weis Exp $ *)

(* Pretty-printing of linearized machine code *)

open Format
open Linearize

val instr: formatter -> instruction -> unit
val fundecl: formatter -> fundecl -> unit
