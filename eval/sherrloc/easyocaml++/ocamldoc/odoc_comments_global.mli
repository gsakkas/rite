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

(* $Id: odoc_comments_global.mli,v 1.2 2003/11/24 10:39:30 starynke Exp $ *)

(** The global variables used by the special comment parser.*)

(** the number of chars used in the lexer. *)
val nb_chars : int ref

(** the authors list *)
val authors : string list ref

(** the version string *)
val version : string option ref

(** the see references *)
val sees : string list ref

(** the since string *)
val since : string option ref

(** the deprecated flag *)
val deprecated : string option ref

(** parameters, with name and description *)
val params : (string * string) list ref

(** the raised exceptions, with name and description *)
val raised_exceptions : (string * string) list ref

(** the description of the return value *)
val return_value : string option ref

(** the strings associated to custom tags. *)
val customs : (string * string) list ref

(** this function inits the variables filled by the parser. *)
val init : unit -> unit
