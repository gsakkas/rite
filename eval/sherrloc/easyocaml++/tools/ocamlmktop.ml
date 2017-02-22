(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*            Xavier Leroy, projet Cristal, INRIA Rocquencourt         *)
(*                                                                     *)
(*  Copyright 1996 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: ocamlmktop.ml,v 1.6 2003/03/24 15:27:01 xleroy Exp $ *)

let _ =
  let args = Ccomp.quote_files (List.tl (Array.to_list Sys.argv)) in
  exit(Sys.command("ocamlc -linkall toplevellib.cma " ^ args ^ " topstart.cmo"))
