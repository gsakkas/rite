(*************************************************************************)
(*                                                                       *)
(*                Objective Caml LablTk library                          *)
(*                                                                       *)
(*            Jacques Garrigue, Kyoto University RIMS                    *)
(*                                                                       *)
(*   Copyright 1999 Institut National de Recherche en Informatique et    *)
(*   en Automatique and Kyoto University.  All rights reserved.          *)
(*   This file is distributed under the terms of the GNU Library         *)
(*   General Public License, with the special exception on linking       *)
(*   described in file ../../../LICENSE.                                 *)
(*                                                                       *)
(*************************************************************************)

(* $Id: jg_completion.mli,v 1.6 2001/12/07 13:39:58 xleroy Exp $ *)

val lt_string : ?nocase:bool -> string -> string -> bool

class timed :  ?nocase:bool -> ?wait:int -> string list -> object
  val mutable texts : string list
  method add : string -> int
  method current : int
  method get_current : string
  method reset : unit
end
