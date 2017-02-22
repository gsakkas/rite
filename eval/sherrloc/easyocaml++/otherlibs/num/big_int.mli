(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*    Valerie Menissier-Morain, projet Cristal, INRIA Rocquencourt     *)
(*                                                                     *)
(*  Copyright 1996 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the GNU Library General Public License, with    *)
(*  the special exception on linking described in file ../../LICENSE.  *)
(*                                                                     *)
(***********************************************************************)

(* $Id: big_int.mli,v 1.10 2002/03/14 20:12:54 xleroy Exp $ *)

(** Operations on arbitrary-precision integers.

   Big integers (type [big_int]) are signed integers of arbitrary size. 
*)
  
open Nat
 
type big_int
        (** The type of big integers. *)

val zero_big_int : big_int
        (** The big integer [0]. *)
val unit_big_int : big_int
        (** The big integer [1]. *)

(** {6 Arithmetic operations} *)

val minus_big_int : big_int -> big_int
        (** Unary negation. *)
val abs_big_int : big_int -> big_int
        (** Absolute value. *)
val add_big_int : big_int -> big_int -> big_int
        (** Addition. *)
val succ_big_int : big_int -> big_int
        (** Successor (add 1). *)
val add_int_big_int : int -> big_int -> big_int
        (** Addition of a small integer to a big integer. *)
val sub_big_int : big_int -> big_int -> big_int
        (** Subtraction. *)
val pred_big_int : big_int -> big_int
        (** Predecessor (subtract 1). *)
val mult_big_int : big_int -> big_int -> big_int
        (** Multiplication of two big integers. *)
val mult_int_big_int : int -> big_int -> big_int
        (** Multiplication of a big integer by a small integer *)
val square_big_int: big_int -> big_int
        (** Return the square of the given big integer *)
val sqrt_big_int: big_int -> big_int
        (** [sqrt_big_int a] returns the integer square root of [a],
           that is, the largest big integer [r] such that [r * r <= a].
           Raise [Invalid_argument] if [a] is negative. *)
val quomod_big_int : big_int -> big_int -> big_int * big_int
        (** Euclidean division of two big integers.
           The first part of the result is the quotient,
           the second part is the remainder.
           Writing [(q,r) = quomod_big_int a b], we have
           [a = q * b + r] and [0 <= r < |b|].
           Raise [Division_by_zero] if the divisor is zero. *)
val div_big_int : big_int -> big_int -> big_int
        (** Euclidean quotient of two big integers.
           This is the first result [q] of [quomod_big_int] (see above). *)
val mod_big_int : big_int -> big_int -> big_int
        (** Euclidean modulus of two big integers.
           This is the second result [r] of [quomod_big_int] (see above). *)
val gcd_big_int : big_int -> big_int -> big_int
        (** Greatest common divisor of two big integers. *)
val power_int_positive_int: int -> int -> big_int
val power_big_int_positive_int: big_int -> int -> big_int
val power_int_positive_big_int: int -> big_int -> big_int
val power_big_int_positive_big_int: big_int -> big_int -> big_int
        (** Exponentiation functions.  Return the big integer
           representing the first argument [a] raised to the power [b]
           (the second argument).  Depending
           on the function, [a] and [b] can be either small integers
           or big integers.  Raise [Invalid_argument] if [b] is negative. *)

(** {6 Comparisons and tests} *)

val sign_big_int : big_int -> int
        (** Return [0] if the given big integer is zero,
           [1] if it is positive, and [-1] if it is negative. *)
val compare_big_int : big_int -> big_int -> int
        (** [compare_big_int a b] returns [0] if [a] and [b] are equal,
           [1] if [a] is greater than [b], and [-1] if [a] is smaller
           than [b]. *)
val eq_big_int : big_int -> big_int -> bool
val le_big_int : big_int -> big_int -> bool
val ge_big_int : big_int -> big_int -> bool
val lt_big_int : big_int -> big_int -> bool
val gt_big_int : big_int -> big_int -> bool
        (** Usual boolean comparisons between two big integers. *)
val max_big_int : big_int -> big_int -> big_int
        (** Return the greater of its two arguments. *)
val min_big_int : big_int -> big_int -> big_int
        (** Return the smaller of its two arguments. *)
val num_digits_big_int : big_int -> int
        (** Return the number of machine words used to store the
           given big integer.  *)

(** {6 Conversions to and from strings} *)

val string_of_big_int : big_int -> string
        (** Return the string representation of the given big integer,
           in decimal (base 10). *)
val big_int_of_string : string -> big_int
        (** Convert a string to a big integer, in decimal.
           The string consists of an optional [-] or [+] sign,
           followed by one or several decimal digits. *)

(** {6 Conversions to and from other numerical types} *)

val big_int_of_int : int -> big_int
        (** Convert a small integer to a big integer. *)
val is_int_big_int : big_int -> bool
        (** Test whether the given big integer is small enough to
           be representable as a small integer (type [int])
           without loss of precision.  On a 32-bit platform,
           [is_int_big_int a] returns [true] if and only if
           [a] is between 2{^30} and 2{^30}-1.  On a 64-bit platform,
           [is_int_big_int a] returns [true] if and only if
           [a] is between -2{^62} and 2{^62}-1. *)
val int_of_big_int : big_int -> int
        (** Convert a big integer to a small integer (type [int]).
           Raises [Failure "int_of_big_int"] if the big integer
           is not representable as a small integer. *)
val float_of_big_int : big_int -> float
        (** Returns a floating-point number approximating the
           given big integer. *)

(**/**)

(** {6 For internal use} *)
val nat_of_big_int : big_int -> nat
val big_int_of_nat : nat -> big_int
val base_power_big_int: int -> int -> big_int -> big_int
val sys_big_int_of_string: string -> int -> int -> big_int
val round_futur_last_digit : string -> int -> int -> bool
val approx_big_int: int -> big_int -> string
