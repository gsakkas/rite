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

(* $Id: source.ml,v 1.8 2006/12/09 13:49:10 ertai Exp $ *)

(************************ Source management ****************************)

open Misc
open Primitives

let source_extensions = [".ml"]

(*** Conversion function. ***)

let source_of_module pos mdle =
  let fname = pos.Lexing.pos_fname in
  if fname = "" then
    let rec loop =
      function
      | [] -> raise Not_found
      | ext :: exts ->
          try find_in_path_uncap !Config.load_path (mdle ^ ext)
          with Not_found -> loop exts
    in loop source_extensions
  else if Filename.is_implicit fname then
    find_in_path !Config.load_path fname
  else
    fname

(*** Buffer cache ***)

(* Buffer and cache (to associate lines and positions in the buffer). *)
type buffer = string * (int * int) list ref

let buffer_max_count = ref 10

let cache_size = 30

let buffer_list =
  ref ([] : (string * buffer) list)

let flush_buffer_list () =
  buffer_list := []

let get_buffer pos mdle =
  try List.assoc mdle !buffer_list with
    Not_found ->
      let inchan = open_in_bin (source_of_module pos mdle) in
        let (content, _) as buffer =
          (String.create (in_channel_length inchan), ref [])
        in
          unsafe_really_input inchan content 0 (in_channel_length inchan);
          buffer_list :=
            (list_truncate !buffer_max_count ((mdle, buffer)::!buffer_list));
          buffer

let buffer_content =
  (fst : buffer -> string)

let buffer_length x =
  String.length (buffer_content x)

(*** Position conversions. ***)

type position = int * int

(* Insert a new pair (position, line) in the cache of the given buffer. *)
let insert_pos buffer ((position, line) as pair) =
  let rec new_list =
    function
      [] ->
        [(position, line)]
    | ((pos, lin) as a::l) as l' ->
        if lin < line then
          pair::l'
        else if lin = line then
          l'
        else
          a::(new_list l)
  in
    let buffer_cache = snd buffer in
      buffer_cache := new_list !buffer_cache

(* Position of the next linefeed after `pos'. *)
(* Position just after the buffer end if no linefeed found. *)
(* Raise `Out_of_range' if already there. *)
let next_linefeed (buffer, _) pos =
  let len = String.length buffer in
    if pos >= len then
      raise Out_of_range
    else
      let rec search p =
        if p = len || String.get buffer p = '\n' then
          p
        else
          search (succ p)
      in
        search pos

(* Go to next line. *)
let next_line buffer (pos, line) =
  (next_linefeed buffer pos + 1, line + 1)

(* Convert a position in the buffer to a line number. *)
let line_of_pos buffer position =
  let rec find =
    function
    | [] ->
        if position < 0 then
          raise Out_of_range
        else
          (0, 1)
    | ((pos, line) as pair)::l ->
        if pos > position then
          find l
        else
          pair
  and find_line previous =
    let (pos, line) as next = next_line buffer previous in
      if pos <= position then
        find_line next
      else
        previous
  in
    let result = find_line (find !(snd buffer)) in
      insert_pos buffer result;
      result

(* Convert a line number to a position. *)
let pos_of_line buffer line =
  let rec find =
    function
      [] ->
        if line <= 0 then
          raise Out_of_range
        else
          (0, 1)
    | ((pos, lin) as pair)::l ->
        if lin > line then
          find l
        else
          pair
  and find_pos previous =
    let (_, lin) as next = next_line buffer previous in
      if lin <= line then
        find_pos next
      else
        previous
  in
    let result = find_pos (find !(snd buffer)) in
      insert_pos buffer result;
      result

(* Convert a coordinate (line / column) into a position. *)
(* --- The first line and column are line 1 and column 1. *)
let point_of_coord buffer line column =
  fst (pos_of_line buffer line) + (pred column)
