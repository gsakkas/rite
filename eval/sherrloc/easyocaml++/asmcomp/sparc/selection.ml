(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*            Xavier Leroy, projet Cristal, INRIA Rocquencourt         *)
(*                                                                     *)
(*  Copyright 1997 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: selection.ml,v 1.8 2002/11/29 15:03:08 xleroy Exp $ *)

(* Instruction selection for the Sparc processor *)

open Misc
open Cmm
open Reg
open Arch
open Mach

class selector = object (self)

inherit Selectgen.selector_generic as super

method is_immediate n = (n <= 4095) && (n >= -4096)

method select_addressing = function
    Cconst_symbol s ->
      (Ibased(s, 0), Ctuple [])
  | Cop(Cadda, [Cconst_symbol s; Cconst_int n]) ->
      (Ibased(s, n), Ctuple [])
  | Cop(Cadda, [arg; Cconst_int n]) ->
      (Iindexed n, arg)
  | Cop(Cadda, [arg1; Cop(Caddi, [arg2; Cconst_int n])]) ->
      (Iindexed n, Cop(Cadda, [arg1; arg2]))
  | arg ->
      (Iindexed 0, arg)

method select_operation op args =
  match (op, args) with
  (* For SPARC V7 multiplication, division and modulus are turned into
     calls to C library routines, except if the dividend is a power of 2.
     For SPARC V8 and V9, use hardware multiplication and division,
     but C library routine for modulus. *)
    (Cmuli, [arg; Cconst_int n]) when n = 1 lsl (Misc.log2 n) ->
      (Iintop_imm(Ilsl, Misc.log2 n), [arg])
  | (Cmuli, [Cconst_int n; arg]) when n = 1 lsl (Misc.log2 n) ->
      (Iintop_imm(Ilsl, Misc.log2 n), [arg])
  | (Cmuli, _) when !arch_version = SPARC_V7 ->
      (Iextcall(".umul", false), args)
  | (Cdivi, [arg; Cconst_int n])
    when self#is_immediate n && n = 1 lsl (Misc.log2 n) ->
      (Iintop_imm(Idiv, n), [arg])
  | (Cdivi, _) when !arch_version = SPARC_V7 ->
      (Iextcall(".div", false), args)
  | (Cmodi, [arg; Cconst_int n])
    when self#is_immediate n && n = 1 lsl (Misc.log2 n) ->
      (Iintop_imm(Imod, n), [arg])
  | (Cmodi, _) ->
      (Iextcall(".rem", false), args)
  | _ ->
      super#select_operation op args

(* Override insert_move_args to deal correctly with floating-point
   arguments being passed into pairs of integer registers. *)
method insert_move_args arg loc stacksize =
  if stacksize <> 0 then self#insert (Iop(Istackoffset stacksize)) [||] [||];
  let locpos = ref 0 in
  for i = 0 to Array.length arg - 1 do
    let src = arg.(i) in
    let dst = loc.(!locpos) in
    match (src, dst) with
      ({typ = Float}, {typ = Int}) ->
        let dst2 = loc.(!locpos + 1) in
        self#insert (Iop Imove) [|src|] [|dst; dst2|];
        locpos := !locpos + 2
    | (_, _) ->
        self#insert_move src dst;
        incr locpos
  done

end

let fundecl f = (new selector)#emit_fundecl f
