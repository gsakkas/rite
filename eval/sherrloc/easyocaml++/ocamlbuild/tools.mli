(***********************************************************************)
(*                             ocamlbuild                              *)
(*                                                                     *)
(*  Nicolas Pouillard, Berke Durak, projet Gallium, INRIA Rocquencourt *)
(*                                                                     *)
(*  Copyright 2007 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: tools.mli,v 1.1.4.1 2007/11/28 16:06:06 ertai Exp $ *)
(* Original author: Nicolas Pouillard *)
(* Tools *)

val tags_of_pathname : Pathname.t -> Tags.t
val flags_of_pathname : Pathname.t -> Command.spec
val path_and_context_of_string : Pathname.t -> Pathname.t list
val pp_l : Format.formatter -> string list -> unit
