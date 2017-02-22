(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*            Xavier Leroy, projet Cristal, INRIA Rocquencourt         *)
(*                                                                     *)
(*  Copyright 2000 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: selection.ml,v 1.6 2007/02/09 13:31:14 doligez Exp $ *)

(* Instruction selection for the AMD64 *)

open Misc
open Arch
open Proc
open Cmm
open Reg
open Mach

(* Auxiliary for recognizing addressing modes *)

type addressing_expr =
    Asymbol of string
  | Alinear of expression
  | Aadd of expression * expression
  | Ascale of expression * int
  | Ascaledadd of expression * expression * int

let rec select_addr exp =
  match exp with
    Cconst_symbol s ->
      (Asymbol s, 0)
  | Cop((Caddi | Cadda), [arg; Cconst_int m]) ->
      let (a, n) = select_addr arg in (a, n + m)
  | Cop((Csubi | Csuba), [arg; Cconst_int m]) ->
      let (a, n) = select_addr arg in (a, n - m)
  | Cop((Caddi | Cadda), [Cconst_int m; arg]) ->
      let (a, n) = select_addr arg in (a, n + m)
  | Cop(Clsl, [arg; Cconst_int(1|2|3 as shift)]) ->
      begin match select_addr arg with
        (Alinear e, n) -> (Ascale(e, 1 lsl shift), n lsl shift)
      | _ -> (Alinear exp, 0)
      end
  | Cop(Cmuli, [arg; Cconst_int(2|4|8 as mult)]) ->
      begin match select_addr arg with
        (Alinear e, n) -> (Ascale(e, mult), n * mult)
      | _ -> (Alinear exp, 0)
      end
  | Cop(Cmuli, [Cconst_int(2|4|8 as mult); arg]) ->
      begin match select_addr arg with
        (Alinear e, n) -> (Ascale(e, mult), n * mult)
      | _ -> (Alinear exp, 0)
      end
  | Cop((Caddi | Cadda), [arg1; arg2]) ->
      begin match (select_addr arg1, select_addr arg2) with
          ((Alinear e1, n1), (Alinear e2, n2)) ->
              (Aadd(e1, e2), n1 + n2)
        | ((Alinear e1, n1), (Ascale(e2, scale), n2)) ->
              (Ascaledadd(e1, e2, scale), n1 + n2)
        | ((Ascale(e1, scale), n1), (Alinear e2, n2)) ->
              (Ascaledadd(e2, e1, scale), n1 + n2)
        | (_, (Ascale(e2, scale), n2)) ->
              (Ascaledadd(arg1, e2, scale), n2)
        | ((Ascale(e1, scale), n1), _) ->
              (Ascaledadd(arg2, e1, scale), n1)
        | _ ->
              (Aadd(arg1, arg2), 0)
      end
  | arg ->
      (Alinear arg, 0)

(* Special constraints on operand and result registers *)

exception Use_default

let rax = phys_reg 0
let rcx = phys_reg 5
let rdx = phys_reg 4

let pseudoregs_for_operation op arg res =
  match op with
  (* Two-address binary operations: arg.(0) and res.(0) must be the same *)
    Iintop(Iadd|Isub|Imul|Iand|Ior|Ixor) | Iaddf|Isubf|Imulf|Idivf ->
      ([|res.(0); arg.(1)|], res)
  (* One-address unary operations: arg.(0) and res.(0) must be the same *)
  | Iintop_imm((Iadd|Isub|Imul|Iand|Ior|Ixor|Ilsl|Ilsr|Iasr), _)
  | Iabsf | Inegf ->
      (res, res)
  | Ispecific(Ifloatarithmem(_,_)) ->
      let arg' = Array.copy arg in
      arg'.(0) <- res.(0);
      (arg', res)
  (* For shifts with variable shift count, second arg must be in rcx *)
  | Iintop(Ilsl|Ilsr|Iasr) ->
      ([|res.(0); rcx|], res)
  (* For div and mod, first arg must be in rax, rdx is clobbered,
     and result is in rax or rdx respectively.
     Keep it simple, just force second argument in rcx. *)
  | Iintop(Idiv) ->
      ([| rax; rcx |], [| rax |])
  | Iintop(Imod) ->
      ([| rax; rcx |], [| rdx |])
  (* For div and mod with immediate operand, arg must not be in rax.
     Keep it simple, force it in rdx. *)
  | Iintop_imm((Idiv|Imod), _) ->
      ([| rdx |], [| rdx |])
  (* Other instructions are regular *)
  | _ -> raise Use_default

(* The selector class *)

class selector = object (self)

inherit Selectgen.selector_generic as super

method is_immediate n = n <= 0x7FFFFFFF && n >= -0x80000000

method is_immediate_natint n = n <= 0x7FFFFFFFn && n >= -0x80000000n

method select_addressing exp =
  match select_addr exp with
    (Asymbol s, d) ->
      (Ibased(s, d), Ctuple [])
  | (Alinear e, d) ->
      (Iindexed d, e)
  | (Aadd(e1, e2), d) ->
      (Iindexed2 d, Ctuple[e1; e2])
  | (Ascale(e, scale), d) ->
      (Iscaled(scale, d), e)
  | (Ascaledadd(e1, e2, scale), d) ->
      (Iindexed2scaled(scale, d), Ctuple[e1; e2])

method select_store addr exp =
  match exp with
    Cconst_int n when self#is_immediate n ->
      (Ispecific(Istore_int(Nativeint.of_int n, addr)), Ctuple [])
  | Cconst_natint n when self#is_immediate_natint n ->
      (Ispecific(Istore_int(n, addr)), Ctuple [])
  | Cconst_pointer n when self#is_immediate n ->
      (Ispecific(Istore_int(Nativeint.of_int n, addr)), Ctuple [])
  | Cconst_natpointer n when self#is_immediate_natint n ->
      (Ispecific(Istore_int(n, addr)), Ctuple [])
  | Cconst_symbol s when not !pic_code ->
      (Ispecific(Istore_symbol(s, addr)), Ctuple [])
  | _ ->
      super#select_store addr exp

method select_operation op args =
  match op with
  (* Recognize the LEA instruction *)
    Caddi | Cadda | Csubi | Csuba ->
      begin match self#select_addressing (Cop(op, args)) with
        (Iindexed d, _) -> super#select_operation op args
      | (Iindexed2 0, _) -> super#select_operation op args
      | (addr, arg) -> (Ispecific(Ilea addr), [arg])
      end
  (* Recognize (x / cst) and (x % cst) only if cst is a power of 2. *)
  | Cdivi ->
      begin match args with
        [arg1; Cconst_int n] when self#is_immediate n
                               && n = 1 lsl (Misc.log2 n) ->
          (Iintop_imm(Idiv, n), [arg1])
      | _ -> (Iintop Idiv, args)
      end
  | Cmodi ->
      begin match args with
        [arg1; Cconst_int n] when self#is_immediate n
                               && n = 1 lsl (Misc.log2 n) ->
          (Iintop_imm(Imod, n), [arg1])
      | _ -> (Iintop Imod, args)
      end
  (* Recognize float arithmetic with memory. *)
  | Caddf ->
      self#select_floatarith true Iaddf Ifloatadd args
  | Csubf ->
      self#select_floatarith false Isubf Ifloatsub args
  | Cmulf ->
      self#select_floatarith true Imulf Ifloatmul args
  | Cdivf ->
      self#select_floatarith false Idivf Ifloatdiv args
  (* Recognize store instructions *)
  | Cstore Word ->
      begin match args with
        [loc; Cop(Caddi, [Cop(Cload _, [loc']); Cconst_int n])]
        when loc = loc' && self#is_immediate n ->
          let (addr, arg) = self#select_addressing loc in
          (Ispecific(Ioffset_loc(n, addr)), [arg])
      | _ ->
          super#select_operation op args
      end
  | _ -> super#select_operation op args

(* Recognize float arithmetic with mem *)

method select_floatarith commutative regular_op mem_op args =
  match args with
    [arg1; Cop(Cload (Double|Double_u), [loc2])] ->
      let (addr, arg2) = self#select_addressing loc2 in
      (Ispecific(Ifloatarithmem(mem_op, addr)),
                 [arg1; arg2])
  | [Cop(Cload (Double|Double_u), [loc1]); arg2] when commutative ->
      let (addr, arg1) = self#select_addressing loc1 in
      (Ispecific(Ifloatarithmem(mem_op, addr)),
                 [arg2; arg1])
  | [arg1; arg2] ->
      (regular_op, [arg1; arg2])
  | _ ->
      assert false

(* Deal with register constraints *)

method insert_op_debug op dbg rs rd =
  try
    let (rsrc, rdst) = pseudoregs_for_operation op rs rd in
    self#insert_moves rs rsrc;
    self#insert_debug (Iop op) dbg rsrc rdst;
    self#insert_moves rdst rd;
    rd
  with Use_default ->
    super#insert_op_debug op dbg rs rd

method insert_op op rs rd =
  self#insert_op_debug op Debuginfo.none rs rd

end

let fundecl f = (new selector)#emit_fundecl f
