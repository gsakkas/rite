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

(* $Id: spill.mli,v 1.4 1999/11/17 18:56:38 xleroy Exp $ *)

(* Insertion of moves to suggest possible spilling / reloading points 
   before register allocation. *)

val fundecl: Mach.fundecl -> Mach.fundecl
