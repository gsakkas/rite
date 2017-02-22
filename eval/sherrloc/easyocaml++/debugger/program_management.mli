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

(* $Id: program_management.mli,v 1.2 1999/11/17 18:57:27 xleroy Exp $ *)

(*** Program loading and initializations. ***)

val loaded : bool ref
val ensure_loaded : unit -> unit

(*** Kill program. ***)
val kill_program : unit -> unit

(* Ask wether to kill the program or not. *)
(* If yes, kill it. *)
(* Return true iff the program has been killed. *)
val ask_kill_program : unit -> bool
