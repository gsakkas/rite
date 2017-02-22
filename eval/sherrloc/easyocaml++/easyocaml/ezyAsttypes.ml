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

(* $Id: asttypes.mli,v 1.9 2003/04/25 12:27:30 xleroy Exp $ *)

(* Auxiliary a.s.t. types used by parsetree and typedtree. *)

type constant =
  | Const_int of int
  | Const_char of char
  | Const_string of string
  | Const_float of string
 (*
  | Const_int32 of int32
  | Const_int64 of int64
  | Const_nativeint of nativeint
 *)


let print_constant ppf = function
  | Const_int n ->
      Format.fprintf ppf "%d" n
  | Const_char c ->
      Format.fprintf ppf "'%c'" c
  | Const_string s ->
      Format.fprintf ppf "\"%s\"" (String.escaped s)
  | Const_float f ->
      Format.pp_print_string ppf f


type rec_flag = Asttypes.rec_flag = Nonrecursive | Recursive | Default

type direction_flag = Asttypes.direction_flag = Upto | Downto

(*type private_flag = Private | Public*)

type mutable_flag = Asttypes.mutable_flag = Immutable | Mutable

(*type virtual_flag = Virtual | Concrete*)

type label = string
