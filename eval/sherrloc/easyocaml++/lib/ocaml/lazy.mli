(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*            Damien Doligez, projet Para, INRIA Rocquencourt          *)
(*                                                                     *)
(*  Copyright 1997 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the GNU Library General Public License, with    *)
(*  the special exception on linking described in file ../LICENSE.     *)
(*                                                                     *)
(***********************************************************************)

(* $Id: lazy.mli,v 1.10 2002/07/30 13:02:56 xleroy Exp $ *)

(** Deferred computations. *)

type 'a t = 'a lazy_t;;
(** A value of type ['a Lazy.t] is a deferred computation, called
   a suspension, that has a result of type ['a].  The special
   expression syntax [lazy (expr)] makes a suspension of the
   computation of [expr], without computing [expr] itself yet.
   "Forcing" the suspension will then compute [expr] and return its
   result.

   Note: [lazy_t] is the built-in type constructor used by the compiler
   for the [lazy] keyword.  You should not use it directly.  Always use
   [Lazy.t] instead.

   Note: if the program is compiled with the [-rectypes] option,
   ill-founded recursive definitions of the form [let rec x = lazy x]
   or [let rec x = lazy(lazy(...(lazy x)))] are accepted by the type-checker
   and lead, when forced, to ill-formed values that trigger infinite
   loops in the garbage collector and other parts of the run-time system.
   Without the [-rectypes] option, such ill-founded recursive definitions
   are rejected by the type-checker.
*)


exception Undefined;;

val force : 'a t -> 'a;;
(** [force x] forces the suspension [x] and returns its result.
   If [x] has already been forced, [Lazy.force x] returns the
   same value again without recomputing it.  If it raised an exception,
   the same exception is raised again.
   Raise [Undefined] if the forcing of [x] tries to force [x] itself
   recursively.
*)

val force_val : 'a t -> 'a;;
(** [force_val x] forces the suspension [x] and returns its
    result.  If [x] has already been forced, [force_val x]
    returns the same value again without recomputing it.
    Raise [Undefined] if the forcing of [x] tries to force [x] itself
    recursively.
    If the computation of [x] raises an exception, it is unspecified
    whether [force_val x] raises the same exception or [Undefined].
*)

val lazy_from_fun : (unit -> 'a) -> 'a t;;
(** [lazy_from_fun f] is the same as [lazy (f ())] but slightly more
    efficient. *)

val lazy_from_val : 'a -> 'a t;;
(** [lazy_from_val v] returns an already-forced suspension of [v]
    This is for special purposes only and should not be confused with
    [lazy (v)]. *)

val lazy_is_val : 'a t -> bool;;
(** [lazy_is_val x] returns [true] if [x] has already been forced and
    did not raise an exception. *)
