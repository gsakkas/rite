(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*             Damien Doligez, projet Para, INRIA Rocquencourt         *)
(*                                                                     *)
(*  Copyright 1999 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: printast.mli,v 1.2 2000/03/06 22:11:39 weis Exp $ *)

open Parsetree;;
open Format;;

val fmt_location: formatter -> Location.t -> unit;;

val expression : int -> formatter -> expression -> unit;;
val interface : formatter -> signature_item list -> unit;;
val implementation : formatter -> structure_item list -> unit;;
val top_phrase : formatter -> toplevel_phrase -> unit;;
val core_type: int -> formatter -> core_type -> unit;;
val fmt_mutable_flag: formatter -> Asttypes.mutable_flag -> unit;;
