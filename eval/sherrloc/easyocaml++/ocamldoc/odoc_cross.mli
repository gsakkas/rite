(***********************************************************************)
(*                             OCamldoc                                *)
(*                                                                     *)
(*            Maxence Guesdon, projet Cristal, INRIA Rocquencourt      *)
(*                                                                     *)
(*  Copyright 2001 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: odoc_cross.mli,v 1.3 2006/09/20 11:14:36 doligez Exp $ *)

(** Cross-referencing. *)

val associate : Odoc_module.t_module list -> unit

val assoc_comments_info :
    string -> Odoc_module.t_module list ->
      Odoc_types.info -> Odoc_types.info
