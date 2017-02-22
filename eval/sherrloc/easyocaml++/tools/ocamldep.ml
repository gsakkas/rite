(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*            Xavier Leroy, projet Cristal, INRIA Rocquencourt         *)
(*                                                                     *)
(*  Copyright 1999 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: ocamldep.ml,v 1.41 2007/02/12 08:10:00 weis Exp $ *)

open Format
open Location
open Longident
open Parsetree


(* Print the dependencies *)

let load_path = ref ([] : (string * string array) list)
let native_only = ref false
let force_slash = ref false
let error_occurred = ref false
let raw_dependencies = ref false

(* Fix path to use '/' as directory separator instead of '\'.
   Only under Windows. *)

let fix_slash s =
  if Sys.os_type = "Unix" then s else begin
    let r = String.copy s in
    for i = 0 to String.length r - 1 do
      if r.[i] = '\\' then r.[i] <- '/'
    done;
    r
  end

let add_to_load_path dir =
  try
    let dir = Misc.expand_directory Config.standard_library dir in
    let contents = Sys.readdir dir in
    load_path := !load_path @ [dir, contents]
  with Sys_error msg ->
    fprintf Format.err_formatter "@[Bad -I option: %s@]@." msg;
    error_occurred := true

let find_file name =
  let uname = String.uncapitalize name in
  let rec find_in_array a pos =
    if pos >= Array.length a then None else begin
      let s = a.(pos) in
      if s = name || s = uname then Some s else find_in_array a (pos + 1)
    end in
  let rec find_in_path = function
    [] -> raise Not_found
  | (dir, contents) :: rem ->
      match find_in_array contents 0 with
        Some truename ->
          if dir = "." then truename else Filename.concat dir truename
      | None -> find_in_path rem in
  find_in_path !load_path

let find_dependency modname (byt_deps, opt_deps) =
  try
    let filename = find_file (modname ^ ".mli") in
    let basename = Filename.chop_suffix filename ".mli" in
    let optname =
      if Sys.file_exists (basename ^ ".ml")
      then basename ^ ".cmx"
      else basename ^ ".cmi" in
    ((basename ^ ".cmi") :: byt_deps, optname :: opt_deps)
  with Not_found ->
  try
    let filename = find_file (modname ^ ".ml") in
    let basename = Filename.chop_suffix filename ".ml" in
    let bytename =
      basename ^ (if !native_only then ".cmx" else ".cmo") in
    (bytename :: byt_deps, (basename ^ ".cmx") :: opt_deps)
  with Not_found ->
    (byt_deps, opt_deps)

let (depends_on, escaped_eol) = (": ", "\\\n    ")

let print_filename s =
  let s = if !force_slash then fix_slash s else s in
  if not (String.contains s ' ') then begin
    print_string s;
  end else begin
    let rec count n i =
      if i >= String.length s then n
      else if s.[i] = ' ' then count (n+1) (i+1)
      else count n (i+1)
    in
    let spaces = count 0 0 in
    let result = String.create (String.length s + spaces) in
    let rec loop i j =
      if i >= String.length s then ()
      else if s.[i] = ' ' then begin
        result.[j] <- '\\';
        result.[j+1] <- ' ';
        loop (i+1) (j+2);
      end else begin
        result.[j] <- s.[i];
        loop (i+1) (j+1);
      end
    in
    loop 0 0;
    print_string result;
  end
;;

let print_dependencies target_file deps =
  match deps with
    [] -> ()
  | _ ->
    print_filename target_file; print_string depends_on;
    let rec print_items pos = function
      [] -> print_string "\n"
    | dep :: rem ->
        if pos + String.length dep <= 77 then begin
          print_filename dep; print_string " ";
          print_items (pos + String.length dep + 1) rem
        end else begin
          print_string escaped_eol; print_filename dep; print_string " ";
          print_items (String.length dep + 5) rem
        end in
    print_items (String.length target_file + 2) deps

let print_raw_dependencies source_file deps =
  print_filename source_file; print_string ":";
  Depend.StringSet.iter
    (fun dep -> print_char ' '; print_string dep)
    deps;
  print_char '\n'

(* Optionally preprocess a source file *)

let preprocessor = ref None

exception Preprocessing_error

let preprocess sourcefile =
  match !preprocessor with
    None -> sourcefile
  | Some pp ->
      flush stdout;
      let tmpfile = Filename.temp_file "camlpp" "" in
      let comm = Printf.sprintf "%s %s > %s" pp sourcefile tmpfile in
      if Sys.command comm <> 0 then begin
        Misc.remove_file tmpfile;
        raise Preprocessing_error
      end;
      tmpfile

let remove_preprocessed inputfile =
  match !preprocessor with
    None -> ()
  | Some _ -> Misc.remove_file inputfile

(* Parse a file or get a dumped syntax tree in it *)

let is_ast_file ic ast_magic =
  try
    let buffer = String.create (String.length ast_magic) in
    really_input ic buffer 0 (String.length ast_magic);
    if buffer = ast_magic then true
    else if String.sub buffer 0 9 = String.sub ast_magic 0 9 then
      failwith "Ocaml and preprocessor have incompatible versions"
    else false
  with End_of_file -> false

let parse_use_file ic =
  if is_ast_file ic Config.ast_impl_magic_number then
    let _source_file = input_value ic in
    [Ptop_def (input_value ic : Parsetree.structure)]
  else begin
    seek_in ic 0;
    let lb = Lexing.from_channel ic in
    Parse.use_file lb
  end

let parse_interface ic =
  if is_ast_file ic Config.ast_intf_magic_number then
    let _source_file = input_value ic in
    (input_value ic : Parsetree.signature)
  else begin
    seek_in ic 0;
    let lb = Lexing.from_channel ic in
    Parse.interface lb
  end

(* Process one file *)

let ml_file_dependencies source_file =
  Depend.free_structure_names := Depend.StringSet.empty;
  let input_file = preprocess source_file in
  let ic = open_in_bin input_file in
  try
    let ast = parse_use_file ic in
    Depend.add_use_file Depend.StringSet.empty ast;
    if !raw_dependencies then begin
      print_raw_dependencies source_file !Depend.free_structure_names
    end else begin
      let basename = Filename.chop_suffix source_file ".ml" in
      let init_deps =
        if Sys.file_exists (basename ^ ".mli")
        then let cmi_name = basename ^ ".cmi" in ([cmi_name], [cmi_name])
        else ([], []) in
      let (byt_deps, opt_deps) =
        Depend.StringSet.fold find_dependency
                              !Depend.free_structure_names init_deps in
      print_dependencies (basename ^ ".cmo") byt_deps;
      print_dependencies (basename ^ ".cmx") opt_deps
    end;
    close_in ic; remove_preprocessed input_file
  with x ->
    close_in ic; remove_preprocessed input_file; raise x

let mli_file_dependencies source_file =
  Depend.free_structure_names := Depend.StringSet.empty;
  let input_file = preprocess source_file in
  let ic = open_in_bin input_file in
  try
    let ast = parse_interface ic in
    Depend.add_signature Depend.StringSet.empty ast;
    if !raw_dependencies then begin
      print_raw_dependencies source_file !Depend.free_structure_names
    end else begin
      let basename = Filename.chop_suffix source_file ".mli" in
      let (byt_deps, opt_deps) =
        Depend.StringSet.fold find_dependency
                              !Depend.free_structure_names ([], []) in
      print_dependencies (basename ^ ".cmi") byt_deps
    end;
    close_in ic; remove_preprocessed input_file
  with x ->
    close_in ic; remove_preprocessed input_file; raise x

let file_dependencies source_file =
  Location.input_name := source_file;
  try
    if Sys.file_exists source_file then begin
      if Filename.check_suffix source_file ".ml" then
        ml_file_dependencies source_file
      else if Filename.check_suffix source_file ".mli" then
        mli_file_dependencies source_file
      else ()
    end
  with x ->
    let report_err = function
    | Lexer.Error(err, range) ->
        fprintf Format.err_formatter "@[%a%a@]@."
        Location.print range  Lexer.report_error err
    | Syntaxerr.Error err ->
        fprintf Format.err_formatter "@[%a@]@."
        Syntaxerr.report_error err
    | Sys_error msg ->
        fprintf Format.err_formatter "@[I/O error:@ %s@]@." msg
    | Preprocessing_error ->
        fprintf Format.err_formatter "@[Preprocessing error on file %s@]@."
            source_file
    | x -> raise x in
    error_occurred := true;
    report_err x

(* Entry point *)

let usage = "Usage: ocamldep [options] <source files>\nOptions are:"

let print_version () =
  printf "ocamldep, version %s@." Sys.ocaml_version;
  exit 0;
;;

let _ =
  Clflags.classic := false;
  add_to_load_path Filename.current_dir_name;
  Arg.parse [
     "-I", Arg.String add_to_load_path,
       "<dir>  Add <dir> to the list of include directories";
     "-modules", Arg.Set raw_dependencies,
       "  Print module dependencies in raw form (output is not suitable for make)";
     "-native", Arg.Set native_only,
       "  Generate dependencies for a pure native-code project \
       (no .cmo files)";
     "-pp", Arg.String(fun s -> preprocessor := Some s),
       "<command>  Pipe sources through preprocessor <command>";
     "-slash", Arg.Set force_slash,
       "  (for Windows) Use forward slash / instead of backslash \\ in file paths";
     "-version", Arg.Unit print_version,
      " Print version and exit";
    ] file_dependencies usage;
  exit (if !error_occurred then 2 else 0)
