(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*          Jerome Vouillon, projet Cristal, INRIA Rocquencourt        *)
(*          Objective Caml port by John Malecki and Xavier Leroy       *)
(*                                                                     *)
(*  Copyright 1996 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: show_source.ml,v 1.14 2006/12/09 13:49:10 ertai Exp $ *)

open Debugger_config
open Instruct
open Misc
open Parameters
open Primitives
open Printf
open Source

(* Print a line; return the beginning of the next line *)
let print_line buffer line_number start point before =
  let next = next_linefeed buffer start
  and content = buffer_content buffer
  in
    printf "%i " line_number;
    if point <= next && point >= start then
      (print_string (String.sub content start (point - start));
       print_string (if before then event_mark_before else event_mark_after);
       print_string (String.sub content point (next - point)))
    else
      print_string (String.sub content start (next - start));
    print_newline ();
    next

(* Tell Emacs we are nowhere in the source. *)
let show_no_point () =
  if !emacs then printf "\026\026H\n"

(* Print the line containing the point *)
let show_point ev selected =
  let mdle = ev.ev_module in
  let before = (ev.ev_kind = Event_before) in
  if !emacs && selected then
    begin try
      let source = source_of_module ev.ev_loc.Location.loc_start mdle in
      printf "\026\026M%s:%i:%i" source
             ev.ev_loc.Location.loc_start.Lexing.pos_cnum
             ev.ev_loc.Location.loc_end.Lexing.pos_cnum;
      printf "%s\n" (if before then ":before" else ":after")
    with
      Not_found    -> (* get_buffer *)
        prerr_endline ("No source file for " ^ mdle ^ ".");
        show_no_point ()
    end
  else
    begin try
      let pos = Events.get_pos ev in
      let buffer = get_buffer pos mdle in
      let point = pos.Lexing.pos_cnum in
      let (start, line_number) = line_of_pos buffer point in
      ignore(print_line buffer line_number start point before)
    with
      Out_of_range -> (* line_of_pos *)
        prerr_endline "Position out of range."
    | Not_found    -> (* Events.get_pos || get_buffer *)
        prerr_endline ("No source file for " ^ mdle ^ ".")
    end

(* Display part of the source. *)
let show_listing pos mdle start stop point before =
  try
    let buffer = get_buffer pos mdle in
      let rec aff (line_start, line_number) =
        if line_number <= stop then
          aff (print_line buffer line_number line_start point before + 1, line_number + 1)
      in
        aff (pos_of_line buffer start)
  with
    Out_of_range -> (* pos_of_line *)
      prerr_endline "Position out of range."
  | Not_found    -> (* get_buffer *)
      prerr_endline ("No source file for " ^ mdle ^ ".")
