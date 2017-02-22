(*************************************************************************)
(*                                                                       *)
(*                Objective Caml LablTk library                          *)
(*                                                                       *)
(*            Jacques Garrigue, Kyoto University RIMS                    *)
(*                                                                       *)
(*   Copyright 1999 Institut National de Recherche en Informatique et    *)
(*   en Automatique and Kyoto University.  All rights reserved.          *)
(*   This file is distributed under the terms of the GNU Library         *)
(*   General Public License, with the special exception on linking       *)
(*   described in file ../../../LICENSE.                                 *)
(*                                                                       *)
(*************************************************************************)

(* $Id: jg_button.ml,v 1.8 2001/12/07 13:39:58 xleroy Exp $ *)

open Tk

let create_destroyer ~parent ?(text="Ok") tl =
    Button.create parent ~text ~command:(fun () -> destroy tl)

let add_destroyer ?text tl =
    let b = create_destroyer tl ~parent:tl ?text in
    pack [b] ~side:`Bottom ~fill:`X;
    b
