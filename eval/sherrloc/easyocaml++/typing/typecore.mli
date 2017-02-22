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

(* $Id: typecore.mli,v 1.39.2.1 2007/11/19 21:27:17 doligez Exp $ *)

(* Type inference for the core language *)

open Asttypes
open Types
open Format

val is_nonexpansive: Typedtree.expression -> bool

val type_binding:
        Env.t -> rec_flag ->
          (Parsetree.pattern * Parsetree.expression) list -> 
          (Typedtree.pattern * Typedtree.expression) list * Env.t
val type_let:
        Env.t -> rec_flag ->
          (Parsetree.pattern * Parsetree.expression) list -> 
          (Typedtree.pattern * Typedtree.expression) list * Env.t
val type_expression:
        Env.t -> Parsetree.expression -> Typedtree.expression
val type_class_arg_pattern:
        string -> Env.t -> Env.t -> label -> Parsetree.pattern ->
        Typedtree.pattern * (Ident.t * Ident.t * type_expr) list *
        Env.t * Env.t
val type_self_pattern:
        string -> type_expr -> Env.t -> Env.t -> Env.t -> Parsetree.pattern ->
        Typedtree.pattern *
        (Ident.t * type_expr) Meths.t ref *
        (Ident.t * Asttypes.mutable_flag * Asttypes.virtual_flag * type_expr)
            Vars.t ref *
        Env.t * Env.t * Env.t
val type_expect:
        ?in_function:(Location.t * type_expr) ->
        Env.t -> Parsetree.expression -> type_expr -> Typedtree.expression
val type_exp:
        Env.t -> Parsetree.expression -> Typedtree.expression
val type_approx:
        Env.t -> Parsetree.expression -> type_expr
val type_argument:
        Env.t -> Parsetree.expression -> type_expr -> Typedtree.expression

val option_some: Typedtree.expression -> Typedtree.expression
val option_none: type_expr -> Location.t -> Typedtree.expression
val extract_option_type: Env.t -> type_expr -> type_expr
val iter_pattern: (Typedtree.pattern -> unit) -> Typedtree.pattern -> unit
val reset_delayed_checks: unit -> unit
val force_delayed_checks: unit -> unit

val self_coercion : (Path.t * Location.t list ref) list ref

type error =
    Unbound_value of Longident.t
  | Unbound_constructor of Longident.t
  | Unbound_label of Longident.t
  | Polymorphic_label of Longident.t
  | Constructor_arity_mismatch of Longident.t * int * int
  | Label_mismatch of Longident.t * (type_expr * type_expr) list
  | Pattern_type_clash of (type_expr * type_expr) list
  | Multiply_bound_variable of string
  | Orpat_vars of Ident.t
  | Expr_type_clash of (type_expr * type_expr) list
  | Apply_non_function of type_expr
  | Apply_wrong_label of label * type_expr
  | Label_multiply_defined of Longident.t
  | Label_missing of string list
  | Label_not_mutable of Longident.t
  | Incomplete_format of string
  | Bad_conversion of string * int * char
  | Undefined_method of type_expr * string
  | Undefined_inherited_method of string
  | Unbound_class of Longident.t
  | Virtual_class of Longident.t
  | Private_type of type_expr
  | Private_label of Longident.t * type_expr
  | Unbound_instance_variable of string
  | Instance_variable_not_mutable of string
  | Not_subtype of (type_expr * type_expr) list * (type_expr * type_expr) list
  | Outside_class
  | Value_multiply_overridden of string
  | Coercion_failure of
      type_expr * type_expr * (type_expr * type_expr) list * bool
  | Too_many_arguments of bool * type_expr
  | Abstract_wrong_label of label * type_expr
  | Scoping_let_module of string * type_expr
  | Masked_instance_variable of Longident.t
  | Not_a_variant_type of Longident.t
  | Incoherent_label_order
  | Less_general of string * (type_expr * type_expr) list

exception Error of Location.t * error

val report_error: formatter -> error -> unit

(* Forward declaration, to be filled in by Typemod.type_module *)
val type_module: (Env.t -> Parsetree.module_expr -> Typedtree.module_expr) ref
(* Forward declaration, to be filled in by Typeclass.class_structure *)
val type_object:
  (Env.t -> Location.t -> Parsetree.class_structure ->
   Typedtree.class_structure * class_signature * string list) ref
