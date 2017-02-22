(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*            Xavier Leroy, projet Cristal, INRIA Rocquencourt         *)
(*                                                                     *)
(*  Copyright 2000 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: scheduling.ml,v 1.3 2000/07/16 02:57:31 xleroy Exp $ *)

open Schedgen (* to create a dependency *)

(* We don't schedule here on the linearized code, but instead schedule the 
   assembly code generated in Emit. *)

let fundecl f = f
