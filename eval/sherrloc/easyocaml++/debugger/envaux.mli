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

(* $Id: envaux.mli,v 1.5 2000/03/06 22:11:20 weis Exp $ *)

open Format

(* Convert environment summaries to environments *)

val env_of_event: Instruct.debug_event option -> Env.t

(* Empty the environment caches. To be called when load_path changes. *)

val reset_cache: unit -> unit

(* Error report *)

type error =
    Module_not_found of Path.t

exception Error of error

val report_error: formatter -> error -> unit
