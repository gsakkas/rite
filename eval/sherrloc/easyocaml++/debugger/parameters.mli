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

(* $Id: parameters.mli,v 1.2 1999/11/17 18:57:26 xleroy Exp $ *)

(* Miscellaneous parameters *)

val program_name : string ref
val socket_name : string ref
val arguments : string ref
val default_load_path : string list ref

val add_path : string -> unit

(* Used by emacs ? *)
val emacs : bool ref
