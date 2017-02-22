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

(* $Id: parser_aux.mli,v 1.4 1999/11/17 18:57:26 xleroy Exp $ *)

(*open Globals*)

open Primitives

type expression =
    E_ident of Longident.t              (* x or Mod.x *)
  | E_name of int                       (* $xxx *)
  | E_item of expression * int          (* x.1 x.[2] x.(3) *)
  | E_field of expression * string      (* x.lbl !x *)
  | E_result

type break_arg =
    BA_none                             (* break *)
  | BA_pc of int                        (* break PC *)
  | BA_function of expression           (* break FUNCTION *)
  | BA_pos1 of string option * int * int option
                                        (* break @ [MODULE] LINE [POS] *)
  | BA_pos2 of string option * int      (* break @ [MODULE] # OFFSET *)

