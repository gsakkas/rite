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

(* $Id: options.mli,v 1.1 2007/02/07 08:59:14 ertai Exp $ *)
(* Original author: Nicolas Pouillard *)

include Signatures.OPTIONS with type command_spec = Command.spec

val entry : bool Slurp.entry option ref
val init : unit -> unit
