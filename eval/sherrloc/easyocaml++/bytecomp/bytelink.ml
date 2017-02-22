(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*            Xavier Leroy, projet Cristal, INRIA Rocquencourt         *)
(*                                                                     *)
(*  Copyright 1996 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: bytelink.ml,v 1.90 2006/09/28 21:36:38 xleroy Exp $ *)

(* Link a set of .cmo files and produce a bytecode executable. *)

open Sys
open Misc
open Config
open Instruct
open Cmo_format

type error =
    File_not_found of string
  | Not_an_object_file of string
  | Symbol_error of string * Symtable.error
  | Inconsistent_import of string * string * string
  | Custom_runtime
  | File_exists of string
  | Cannot_open_dll of string

exception Error of error

type link_action =
    Link_object of string * compilation_unit
      (* Name of .cmo file and descriptor of the unit *)
  | Link_archive of string * compilation_unit list
      (* Name of .cma file and descriptors of the units to be linked. *)

(* Add C objects and options from a library descriptor *)
(* Ignore them if -noautolink or -use-runtime or -use-prim was given *)

let lib_ccobjs = ref []
let lib_ccopts = ref []
let lib_dllibs = ref []

let add_ccobjs l =
  if not !Clflags.no_auto_link
      && String.length !Clflags.use_runtime = 0
      && String.length !Clflags.use_prims = 0
  then begin
    if l.lib_custom then Clflags.custom_runtime := true;
    lib_ccobjs := l.lib_ccobjs @ !lib_ccobjs;
    lib_ccopts := l.lib_ccopts @ !lib_ccopts;
    lib_dllibs := l.lib_dllibs @ !lib_dllibs
  end

(* A note on ccobj ordering:
   - Clflags.ccobjs is in reverse order w.r.t. what was given on the 
        ocamlc command line;
   - l.lib_ccobjs is also in reverse order w.r.t. what was given on the
        ocamlc -a command line when the library was created;
   - Clflags.ccobjs is reversed just before calling the C compiler for the
        custom link;
   - .cma files on the command line of ocamlc are scanned right to left;
   - Before linking, we add lib_ccobjs after Clflags.ccobjs.
   Thus, for ocamlc a.cma b.cma obj1 obj2
   where a.cma was built with ocamlc -i ... obja1 obja2
     and b.cma was built with ocamlc -i ... objb1 objb2
   lib_ccobjs starts as [],
   becomes objb2 objb1 when b.cma is scanned,
   then obja2 obja1 objb2 objb1 when a.cma is scanned.
   Clflags.ccobjs was initially obj2 obj1.
   and is set to obj2 obj1 obja2 obja1 objb2 objb1.
   Finally, the C compiler is given objb1 objb2 obja1 obja2 obj1 obj2,
   which is what we need.  (If b depends on a, a.cma must appear before
   b.cma, but b's C libraries must appear before a's C libraries.)
*)

(* First pass: determine which units are needed *)

module IdentSet =
  Set.Make(struct
    type t = Ident.t
    let compare = compare
  end)

let missing_globals = ref IdentSet.empty

let is_required (rel, pos) =
  match rel with
    Reloc_setglobal id ->
      IdentSet.mem id !missing_globals
  | _ -> false

let add_required (rel, pos) =
  match rel with
    Reloc_getglobal id ->
      missing_globals := IdentSet.add id !missing_globals
  | _ -> ()

let remove_required (rel, pos) =
  match rel with
    Reloc_setglobal id ->
      missing_globals := IdentSet.remove id !missing_globals
  | _ -> ()

let scan_file obj_name tolink =
  let file_name =
    try
      find_in_path !load_path obj_name
    with Not_found ->
      raise(Error(File_not_found obj_name)) in
  let ic = open_in_bin file_name in
  try
    let buffer = String.create (String.length cmo_magic_number) in
    really_input ic buffer 0 (String.length cmo_magic_number);
    if buffer = cmo_magic_number then begin
      (* This is a .cmo file. It must be linked in any case.
         Read the relocation information to see which modules it
         requires. *)
      let compunit_pos = input_binary_int ic in  (* Go to descriptor *)
      seek_in ic compunit_pos;
      let compunit = (input_value ic : compilation_unit) in
      close_in ic;
      List.iter add_required compunit.cu_reloc;
      Link_object(file_name, compunit) :: tolink
    end
    else if buffer = cma_magic_number then begin
      (* This is an archive file. Each unit contained in it will be linked
         in only if needed. *)
      let pos_toc = input_binary_int ic in    (* Go to table of contents *)
      seek_in ic pos_toc;
      let toc = (input_value ic : library) in
      close_in ic;
      add_ccobjs toc;
      let required =
        List.fold_right
          (fun compunit reqd ->
            if compunit.cu_force_link
            || !Clflags.link_everything
            || List.exists is_required compunit.cu_reloc
            then begin
              List.iter remove_required compunit.cu_reloc;
              List.iter add_required compunit.cu_reloc;
              compunit :: reqd
            end else
              reqd)
          toc.lib_units [] in
      Link_archive(file_name, required) :: tolink
    end
    else raise(Error(Not_an_object_file file_name))
  with
    End_of_file -> close_in ic; raise(Error(Not_an_object_file file_name))
  | x -> close_in ic; raise x

(* Second pass: link in the required units *)

(* Consistency check between interfaces *)

let crc_interfaces = Consistbl.create ()

let check_consistency file_name cu =
  try
    List.iter
      (fun (name, crc) ->
        if name = cu.cu_name
        then Consistbl.set crc_interfaces name crc file_name
        else Consistbl.check crc_interfaces name crc file_name)
      cu.cu_imports
  with Consistbl.Inconsistency(name, user, auth) ->
    raise(Error(Inconsistent_import(name, user, auth)))

let extract_crc_interfaces () =
  Consistbl.extract crc_interfaces

(* Record compilation events *)

let debug_info = ref ([] : (int * string) list)

(* Link in a compilation unit *)

let link_compunit output_fun currpos_fun inchan file_name compunit =
  check_consistency file_name compunit;
  seek_in inchan compunit.cu_pos;
  let code_block = String.create compunit.cu_codesize in
  really_input inchan code_block 0 compunit.cu_codesize;
  Symtable.patch_object code_block compunit.cu_reloc;
  if !Clflags.debug && compunit.cu_debug > 0 then begin
    seek_in inchan compunit.cu_debug;
    let buffer = String.create compunit.cu_debugsize in
    really_input inchan buffer 0 compunit.cu_debugsize;
    debug_info := (currpos_fun(), buffer) :: !debug_info
  end;
  output_fun code_block;
  if !Clflags.link_everything then
    List.iter Symtable.require_primitive compunit.cu_primitives

(* Link in a .cmo file *)

let link_object output_fun currpos_fun file_name compunit =
  let inchan = open_in_bin file_name in
  try
    link_compunit output_fun currpos_fun inchan file_name compunit;
    close_in inchan
  with
    Symtable.Error msg ->
      close_in inchan; raise(Error(Symbol_error(file_name, msg)))
  | x ->
      close_in inchan; raise x

(* Link in a .cma file *)

let link_archive output_fun currpos_fun file_name units_required =
  let inchan = open_in_bin file_name in
  try
    List.iter
      (fun cu ->
         let name = file_name ^ "(" ^ cu.cu_name ^ ")" in
         try
           link_compunit output_fun currpos_fun inchan name cu
         with Symtable.Error msg ->
           raise(Error(Symbol_error(name, msg))))
      units_required;
    close_in inchan
  with x -> close_in inchan; raise x

(* Link in a .cmo or .cma file *)

let link_file output_fun currpos_fun = function
    Link_object(file_name, unit) ->
      link_object output_fun currpos_fun file_name unit
  | Link_archive(file_name, units) ->
      link_archive output_fun currpos_fun file_name units

(* Output the debugging information *)
(* Format is:
      <int32>          number of event lists
      <int32>          offset of first event list
      <output_value>   first event list
      ...
      <int32>          offset of last event list
      <output_value>   last event list *)

let output_debug_info oc =
  output_binary_int oc (List.length !debug_info);
  List.iter
    (fun (ofs, evl) -> output_binary_int oc ofs; output_string oc evl)
    !debug_info;
  debug_info := []

(* Output a list of strings with 0-termination *)

let output_stringlist oc l =
  List.iter (fun s -> output_string oc s; output_byte oc 0) l

(* Transform a file name into an absolute file name *)

let make_absolute file =
  if Filename.is_relative file
  then Filename.concat (Sys.getcwd()) file
  else file

(* Create a bytecode executable file *)

let link_bytecode tolink exec_name standalone =
  Misc.remove_file exec_name; (* avoid permission problems, cf PR#1911 *)
  let outchan =
    open_out_gen [Open_wronly; Open_trunc; Open_creat; Open_binary]
                 0o777 exec_name in
  try
    if standalone then begin
      (* Copy the header *)
      try
        let header =
          if String.length !Clflags.use_runtime > 0
          then "camlheader_ur" else "camlheader" in
        let inchan = open_in_bin (find_in_path !load_path header) in
        copy_file inchan outchan;
        close_in inchan
      with Not_found | Sys_error _ -> ()
    end;
    Bytesections.init_record outchan;
    (* The path to the bytecode interpreter (in use_runtime mode) *)
    if String.length !Clflags.use_runtime > 0 then begin
      output_string outchan (make_absolute !Clflags.use_runtime);
      output_char outchan '\n';
      Bytesections.record outchan "RNTM"
    end;
    (* The bytecode *)
    let start_code = pos_out outchan in
    Symtable.init();
    Consistbl.clear crc_interfaces;
    let sharedobjs = List.map Dll.extract_dll_name !Clflags.dllibs in
    if standalone then begin
      (* Initialize the DLL machinery *)
      Dll.init_compile !Clflags.no_std_include;
      Dll.add_path !load_path;
      try Dll.open_dlls Dll.For_checking sharedobjs
      with Failure reason -> raise(Error(Cannot_open_dll reason))
    end;
    let output_fun = output_string outchan
    and currpos_fun () = pos_out outchan - start_code in
    List.iter (link_file output_fun currpos_fun) tolink;
    if standalone then Dll.close_all_dlls();
    (* The final STOP instruction *)
    output_byte outchan Opcodes.opSTOP;
    output_byte outchan 0; output_byte outchan 0; output_byte outchan 0;
    Bytesections.record outchan "CODE";
    (* DLL stuff *)
    if standalone then begin
      (* The extra search path for DLLs *)
      output_stringlist outchan !Clflags.dllpaths;
      Bytesections.record outchan "DLPT";
      (* The names of the DLLs *)
      output_stringlist outchan sharedobjs;
      Bytesections.record outchan "DLLS"
    end;
    (* The names of all primitives *)
    Symtable.output_primitive_names outchan;
    Bytesections.record outchan "PRIM";
    (* The table of global data *)
    output_value outchan (Symtable.initial_global_table());
    Bytesections.record outchan "DATA";
    (* The map of global identifiers *)
    Symtable.output_global_map outchan;
    Bytesections.record outchan "SYMB";
    (* CRCs for modules *)
    output_value outchan (extract_crc_interfaces());
    Bytesections.record outchan "CRCS";
    (* Debug info *)
    if !Clflags.debug then begin
      output_debug_info outchan;
      Bytesections.record outchan "DBUG"
    end;
    (* The table of contents and the trailer *)
    Bytesections.write_toc_and_trailer outchan;
    close_out outchan
  with x ->
    close_out outchan;
    remove_file exec_name;
    raise x

(* Output a string as a C array of unsigned ints *)

let output_code_string_counter = ref 0

let output_code_string outchan code =
  let pos = ref 0 in
  let len = String.length code in
  while !pos < len do
    let c1 = Char.code(code.[!pos]) in
    let c2 = Char.code(code.[!pos + 1]) in
    let c3 = Char.code(code.[!pos + 2]) in
    let c4 = Char.code(code.[!pos + 3]) in
    pos := !pos + 4;
    Printf.fprintf outchan "0x%02x%02x%02x%02x, " c4 c3 c2 c1;
    incr output_code_string_counter;
    if !output_code_string_counter >= 6 then begin
      output_char outchan '\n';
      output_code_string_counter := 0
    end
  done

(* Output a string as a C string *)

let output_data_string outchan data =
  let counter = ref 0 in
  for i = 0 to String.length data - 1 do
    Printf.fprintf outchan "%d, " (Char.code(data.[i]));
    incr counter;
    if !counter >= 12 then begin
      output_string outchan "\n";
      counter := 0
    end
  done

(* Output a bytecode executable as a C file *)

let link_bytecode_as_c tolink outfile =
  let outchan = open_out outfile in
  try
    (* The bytecode *)
    output_string outchan "#include <caml/mlvalues.h>\n";
    output_string outchan "\
CAMLextern void caml_startup_code(
           code_t code, asize_t code_size,
           char *data, asize_t data_size,
           char *section_table, asize_t section_table_size,
           char **argv);\n";
    output_string outchan "static int caml_code[] = {\n";
    Symtable.init();
    Consistbl.clear crc_interfaces;
    let output_fun = output_code_string outchan
    and currpos_fun () = 0 in
    List.iter (link_file output_fun currpos_fun) tolink;
    (* The final STOP instruction *)
    Printf.fprintf outchan "\n0x%x};\n\n" Opcodes.opSTOP;
    (* The table of global data *)
    output_string outchan "static char caml_data[] = {\n";
    output_data_string outchan
      (Marshal.to_string (Symtable.initial_global_table()) []);
    output_string outchan "\n};\n\n";
    (* The sections *)
    let sections =
      [ "SYMB", Symtable.data_global_map();
        "PRIM", Obj.repr(Symtable.data_primitive_names());
        "CRCS", Obj.repr(extract_crc_interfaces()) ] in
    output_string outchan "static char caml_sections[] = {\n";
    output_data_string outchan
      (Marshal.to_string sections []);
    output_string outchan "\n};\n\n";
    (* The table of primitives *)
    Symtable.output_primitive_table outchan;
    (* The entry point *)
    output_string outchan "\n
void caml_startup(char ** argv)
{
  caml_startup_code(caml_code, sizeof(caml_code),
                    caml_data, sizeof(caml_data),
                    caml_sections, sizeof(caml_sections),
                    argv);
}\n";
    close_out outchan
  with x ->
    close_out outchan;
    raise x

(* Build a custom runtime *)

let build_custom_runtime prim_name exec_name =
  match Config.ccomp_type with
    "cc" ->
      Ccomp.command
       (Printf.sprintf
          "%s -o %s %s %s %s %s %s -lcamlrun %s"
          !Clflags.c_linker
          (Filename.quote exec_name)
          (Clflags.std_include_flag "-I")
          (String.concat " " (List.rev !Clflags.ccopts))
          prim_name
          (Ccomp.quote_files
            (List.map (fun dir -> if dir = "" then "" else "-L" ^ dir)
                      !load_path))
          (Ccomp.quote_files (List.rev !Clflags.ccobjs))
          Config.bytecomp_c_libraries)
  | "msvc" ->
      let retcode =
      Ccomp.command
       (Printf.sprintf
          "%s /Fe%s %s %s %s %s %s %s"
          !Clflags.c_linker
          (Filename.quote exec_name)
          (Clflags.std_include_flag "-I")
          prim_name
          (Ccomp.quote_files
            (List.rev_map Ccomp.expand_libname !Clflags.ccobjs))
          (Filename.quote (Ccomp.expand_libname "-lcamlrun"))
          Config.bytecomp_c_libraries
          (Ccomp.make_link_options !Clflags.ccopts)) in
      (* C compiler doesn't clean up after itself.  Note that the .obj
         file is created in the current working directory. *)
      remove_file
        (Filename.chop_suffix (Filename.basename prim_name) ".c" ^ ".obj");
      if retcode <> 0
      then retcode
      else Ccomp.merge_manifest exec_name
  | _ -> assert false

let append_bytecode_and_cleanup bytecode_name exec_name prim_name =
  let oc = open_out_gen [Open_wronly; Open_append; Open_binary] 0 exec_name in
  let ic = open_in_bin bytecode_name in
  copy_file ic oc;
  close_in ic;
  close_out oc;
  remove_file bytecode_name;
  remove_file prim_name

(* Fix the name of the output file, if the C compiler changes it behind
   our back. *)

let fix_exec_name name =
  match Sys.os_type with
    "Win32" | "Cygwin" ->
      if String.contains name '.' then name else name ^ ".exe"
  | _ -> name

(* Main entry point (build a custom runtime if needed) *)

let logger = new EzyUtils.Logger.logger "linking"

let link objfiles output_name =
  let objfiles =
    if !Clflags.nopervasives then objfiles
    else if !Clflags.output_c_object then "stdlib.cma" :: objfiles
    else "stdlib.cma" :: (objfiles @ ["std_exit.cmo"]) in
  let _ = logger#debug "Linking files %a" (EzyUtils.List.print Format.pp_print_string " ") objfiles in
  let tolink = List.fold_right scan_file objfiles [] in
  Clflags.ccobjs := !Clflags.ccobjs @ !lib_ccobjs; (* put user's libs last *)
  Clflags.ccopts := !lib_ccopts @ !Clflags.ccopts; (* put user's opts first *)
  Clflags.dllibs := !lib_dllibs @ !Clflags.dllibs; (* put user's DLLs first *)
  if not !Clflags.custom_runtime then
    link_bytecode tolink output_name true
  else if not !Clflags.output_c_object then begin
    let bytecode_name = Filename.temp_file "camlcode" "" in
    let prim_name = Filename.temp_file "camlprim" ".c" in
    try
      link_bytecode tolink bytecode_name false;
      let poc = open_out prim_name in
      Symtable.output_primitive_table poc;
      close_out poc;
      let exec_name = fix_exec_name output_name in
      if build_custom_runtime prim_name exec_name <> 0
      then raise(Error Custom_runtime);
      if !Clflags.make_runtime
      then (remove_file bytecode_name; remove_file prim_name)
      else append_bytecode_and_cleanup bytecode_name exec_name prim_name
    with x ->
      remove_file bytecode_name;
      remove_file prim_name;
      raise x
  end else begin
    let c_file =
      Filename.chop_suffix output_name Config.ext_obj ^ ".c" in
    if Sys.file_exists c_file then raise(Error(File_exists c_file));
    try
      link_bytecode_as_c tolink c_file;
      if Ccomp.compile_file c_file <> 0
      then raise(Error Custom_runtime);
      remove_file c_file
    with x ->
      remove_file c_file;
      remove_file output_name;
      raise x
  end

(* Error report *)

open Format

let report_error ppf = function
  | File_not_found name ->
      fprintf ppf "Cannot find file %s" name
  | Not_an_object_file name ->
      fprintf ppf "The file %s is not a bytecode object file" name
  | Symbol_error(name, err) ->
      fprintf ppf "Error while linking %s:@ %a" name
      Symtable.report_error err
  | Inconsistent_import(intf, file1, file2) ->
      fprintf ppf
        "@[<hov>Files %s@ and %s@ \
                 make inconsistent assumptions over interface %s@]"
        file1 file2 intf
  | Custom_runtime ->
      fprintf ppf "Error while building custom runtime system"
  | File_exists file ->
      fprintf ppf "Cannot overwrite existing file %s" file
  | Cannot_open_dll file ->
      fprintf ppf "Error on dynamically loaded library: %s" file
