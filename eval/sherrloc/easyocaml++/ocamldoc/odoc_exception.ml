(***********************************************************************)
(*                             OCamldoc                                *)
(*                                                                     *)
(*            Maxence Guesdon, projet Cristal, INRIA Rocquencourt      *)
(*                                                                     *)
(*  Copyright 2001 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: odoc_exception.ml,v 1.3 2003/11/24 10:39:31 starynke Exp $ *)

(** Representation and manipulation of exceptions. *)

module Name = Odoc_name

type exception_alias = {
    ea_name : Name.t ;
    mutable ea_ex : t_exception option ;
  } 

and t_exception = {
    ex_name : Name.t ;
    mutable ex_info : Odoc_types.info option ; (** optional user information *)
    ex_args : Types.type_expr list ; (** the types of the parameters *)
    ex_alias : exception_alias option ;
    mutable ex_loc : Odoc_types.location ;
    mutable ex_code : string option ;
  } 


