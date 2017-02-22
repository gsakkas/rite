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

(* $Id: mytypes.mli,v 1.6 2003/04/02 06:56:05 garrigue Exp $ *)

open Widget

type edit_window =
  { mutable name: string;
    tw: text widget;
    frame: frame widget;
    modified: Textvariable.textVariable;
    mutable shell: (string * Shell.shell) option;
    mutable structure: Typedtree.structure;
    mutable type_info: Stypes.type_info list;
    mutable signature: Types.signature;
    mutable psignature: Parsetree.signature;
    number: string }
