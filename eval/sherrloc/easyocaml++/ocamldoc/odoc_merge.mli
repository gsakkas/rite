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

(* $Id: odoc_merge.mli,v 1.3 2003/11/24 10:41:05 starynke Exp $ *)

(** Merge of information from [.ml] and [.mli] for a module.*)

(** Merge of two optional info structures.
   Used to merge a comment before and a comment after
   an element in [Odoc_sig.Analyser.analyse_signature_item_desc]. *)
val merge_info_opt :
    Odoc_types.merge_option list ->
      Odoc_types.info option ->
        Odoc_types.info option ->
          Odoc_types.info option

(** Merge of modules which represent the same OCaml module, in a list of t_module.
   There must be at most two t_module for the same OCaml module, one for a .mli, another for the .ml.
   The function returns the list of t_module where same modules have been merged, according
   to the given merge_option list.*)
val merge :
  Odoc_types.merge_option list ->
  Odoc_module.t_module list -> Odoc_module.t_module list

