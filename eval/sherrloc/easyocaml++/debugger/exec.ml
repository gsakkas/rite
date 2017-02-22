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

(* $Id: exec.ml,v 1.4 1999/11/17 18:57:24 xleroy Exp $ *)

(* Handling of keyboard interrupts *)

let interrupted = ref false

let is_protected = ref false

let break signum =
  if !is_protected
  then interrupted := true
  else raise Sys.Break

let _ =
  Sys.set_signal Sys.sigint (Sys.Signal_handle break);
  Sys.set_signal Sys.sigpipe (Sys.Signal_handle (fun _ -> raise End_of_file))

let protect f =
  if !is_protected then
    f ()
  else begin
    is_protected := true;
    if not !interrupted then
       f ();
    is_protected := false;
    if !interrupted then begin interrupted := false; raise Sys.Break end
  end

let unprotect f =
  if not !is_protected then
    f ()
  else begin
    is_protected := false;
    if !interrupted then begin interrupted := false; raise Sys.Break end;
    f ();
    is_protected := true
  end
