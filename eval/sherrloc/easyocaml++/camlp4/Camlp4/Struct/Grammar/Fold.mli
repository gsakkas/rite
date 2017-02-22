(* camlp4r *)
(****************************************************************************)
(*                                                                          *)
(*                              Objective Caml                              *)
(*                                                                          *)
(*                            INRIA Rocquencourt                            *)
(*                                                                          *)
(*  Copyright  2006   Institut National de Recherche  en  Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed under   *)
(*  the terms of the GNU Library General Public License, with the special   *)
(*  exception on linking described in LICENSE at the top of the Objective   *)
(*  Caml source tree.                                                       *)
(*                                                                          *)
(****************************************************************************)

(* $Id: Fold.mli,v 1.2 2006/07/08 17:21:32 pouillar Exp $ *)

(* Authors:
 * - Daniel de Rauglaudre: initial version
 * - Nicolas Pouillard: refactoring
 *)

module Make (Structure : Structure.S) : sig
  open Structure;

  value sfold0 : ('a -> 'b -> 'b) -> 'b -> fold _ 'a 'b;
  value sfold1 : ('a -> 'b -> 'b) -> 'b -> fold _ 'a 'b;
  value sfold0sep : ('a -> 'b -> 'b) -> 'b -> foldsep _ 'a 'b;
  (* value sfold1sep : ('a -> 'b -> 'b) -> 'b -> foldsep _ 'a 'b; *)
end;
