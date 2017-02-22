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

(* $Id: lexer.mli,v 1.6 2004/04/21 23:26:05 doligez Exp $ *)

val main: Lexing.lexbuf -> Parser.token

exception Lexical_error of string * string * int * int

(*n
val line_num: int ref
val line_start_pos: int ref
*)
