(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*            Xavier Leroy, projet Cristal, INRIA Rocquencourt         *)
(*                                                                     *)
(*  Copyright 1996 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the GNU Library General Public License, with    *)
(*  the special exception on linking described in file ../../LICENSE.  *)
(*                                                                     *)
(***********************************************************************)

(* $Id: dynlink.ml,v 1.2 2006/09/28 21:36:38 xleroy Exp $ *)

(* Dynamic loading of .cmo files *)

(* This is a copy of ../otherlibs/dynlink/dynlink.ml that does not
   use Dynlinkaux (the module that packs some of the compiler modules). *)

open Cmo_format

type linking_error =
    Undefined_global of string
  | Unavailable_primitive of string
  | Uninitialized_global of string

type error =
    Not_a_bytecode_file of string
  | Inconsistent_import of string
  | Unavailable_unit of string
  | Unsafe_file
  | Linking_error of string * linking_error
  | Corrupted_interface of string
  | File_not_found of string
  | Cannot_open_dll of string

exception Error of error

(* Management of interface CRCs *)

let crc_interfaces = ref (Consistbl.create ())
let allow_extension = ref true

(* Check that the object file being loaded has been compiled against
   the same interfaces as the program itself. In addition, check that
   only authorized compilation units are referenced. *)

let check_consistency file_name cu =
  try
    List.iter
      (fun (name, crc) ->
        if name = cu.cu_name then
          Consistbl.set !crc_interfaces name crc file_name
        else if !allow_extension then
          Consistbl.check !crc_interfaces name crc file_name
        else
          Consistbl.check_noadd !crc_interfaces name crc file_name)
      cu.cu_imports
  with Consistbl.Inconsistency(name, user, auth) ->
         raise(Error(Inconsistent_import name))
     | Consistbl.Not_available(name) ->
         raise(Error(Unavailable_unit name))

(* Empty the crc_interfaces table *)

let clear_available_units () =
  Consistbl.clear !crc_interfaces;
  allow_extension := false

(* Allow only access to the units with the given names *)

let allow_only names =
  Consistbl.filter (fun name -> List.mem name names) !crc_interfaces;
  allow_extension := false

(* Prohibit access to the units with the given names *)

let prohibit names =
  Consistbl.filter (fun name -> not (List.mem name names)) !crc_interfaces;
  allow_extension := false

(* Initialize the crc_interfaces table with a list of units with fixed CRCs *)

let add_available_units units =
  List.iter (fun (unit, crc) -> Consistbl.set !crc_interfaces unit crc "")
            units

(* Default interface CRCs: those found in the current executable *)
let default_crcs = ref []

let default_available_units () =
  clear_available_units();
  add_available_units !default_crcs;
  allow_extension := true

(* Initialize the linker tables and everything *)

let init () =
  default_crcs := Symtable.init_toplevel();
  default_available_units ()

(* Read the CRC of an interface from its .cmi file *)

let digest_interface unit loadpath =
  let filename =
    let shortname = unit ^ ".cmi" in
    try
      Misc.find_in_path_uncap loadpath shortname
    with Not_found ->
      raise (Error(File_not_found shortname)) in
  let ic = open_in_bin filename in
  try
    let buffer = String.create (String.length Config.cmi_magic_number) in
    really_input ic buffer 0 (String.length Config.cmi_magic_number);
    if buffer <> Config.cmi_magic_number then begin
      close_in ic;
      raise(Error(Corrupted_interface filename))
    end;
    ignore (input_value ic);
    let crc =
      match input_value ic with
        (_, crc) :: _ -> crc
      | _             -> raise(Error(Corrupted_interface filename))
    in
    close_in ic;
    crc
  with End_of_file | Failure _ ->
    close_in ic;
    raise(Error(Corrupted_interface filename))

(* Initialize the crc_interfaces table with a list of units.
   Their CRCs are read from their interfaces. *)

let add_interfaces units loadpath =
  add_available_units
    (List.map (fun unit -> (unit, digest_interface unit loadpath)) units)

(* Check whether the object file being loaded was compiled in unsafe mode *)

let unsafe_allowed = ref false

let allow_unsafe_modules b =
  unsafe_allowed := b

let check_unsafe_module cu =
  if (not !unsafe_allowed) && cu.cu_primitives <> []
  then raise(Error(Unsafe_file))

(* Load in-core and execute a bytecode object file *)

let load_compunit ic file_name compunit =
  check_consistency file_name compunit;
  check_unsafe_module compunit;
  seek_in ic compunit.cu_pos;
  let code_size = compunit.cu_codesize + 8 in
  let code = Meta.static_alloc code_size in
  unsafe_really_input ic code 0 compunit.cu_codesize;
  String.unsafe_set code compunit.cu_codesize (Char.chr Opcodes.opRETURN);
  String.unsafe_set code (compunit.cu_codesize + 1) '\000';
  String.unsafe_set code (compunit.cu_codesize + 2) '\000';
  String.unsafe_set code (compunit.cu_codesize + 3) '\000';
  String.unsafe_set code (compunit.cu_codesize + 4) '\001';
  String.unsafe_set code (compunit.cu_codesize + 5) '\000';
  String.unsafe_set code (compunit.cu_codesize + 6) '\000';
  String.unsafe_set code (compunit.cu_codesize + 7) '\000';
  let initial_symtable = Symtable.current_state() in
  begin try
    Symtable.patch_object code compunit.cu_reloc;
    Symtable.check_global_initialized compunit.cu_reloc;
    Symtable.update_global_table()
  with Symtable.Error error ->
    let new_error =
      match error with
        Symtable.Undefined_global s -> Undefined_global s
      | Symtable.Unavailable_primitive s -> Unavailable_primitive s
      | Symtable.Uninitialized_global s -> Uninitialized_global s
      | _ -> assert false in
    raise(Error(Linking_error (file_name, new_error)))
  end;
  begin try
    ignore((Meta.reify_bytecode code code_size) ())
  with exn ->
    Symtable.restore_state initial_symtable;
    raise exn
  end

let loadfile file_name =
  let ic = open_in_bin file_name in
  try
    let buffer = String.create (String.length Config.cmo_magic_number) in
    really_input ic buffer 0 (String.length Config.cmo_magic_number);
    if buffer = Config.cmo_magic_number then begin
      let compunit_pos = input_binary_int ic in  (* Go to descriptor *)
      seek_in ic compunit_pos;
      load_compunit ic file_name (input_value ic : compilation_unit)
    end else
    if buffer = Config.cma_magic_number then begin
      let toc_pos = input_binary_int ic in  (* Go to table of contents *)
      seek_in ic toc_pos;
      let lib = (input_value ic : library) in
      begin try 
        Dll.open_dlls Dll.For_execution
                      (List.map Dll.extract_dll_name lib.lib_dllibs)
      with Failure reason ->
        raise(Error(Cannot_open_dll reason))
      end;
      List.iter (load_compunit ic file_name) lib.lib_units
    end else
      raise(Error(Not_a_bytecode_file file_name));
    close_in ic
  with exc ->
    close_in ic; raise exc

let loadfile_private file_name =
  let initial_symtable = Symtable.current_state()
  and initial_crc = !crc_interfaces in
  try
    loadfile file_name;
    Symtable.hide_additions initial_symtable;
    crc_interfaces := initial_crc
  with exn ->
    Symtable.hide_additions initial_symtable;
    crc_interfaces := initial_crc;
    raise exn

(* Error report *)

let error_message = function
    Not_a_bytecode_file name ->
      name ^ " is not a bytecode object file"
  | Inconsistent_import name ->
      "interface mismatch on " ^ name
  | Unavailable_unit name ->
      "no implementation available for " ^ name
  | Unsafe_file ->
      "this object file uses unsafe features"
  | Linking_error (name, Undefined_global s) ->
      "error while linking " ^ name ^ ".\n" ^
      "Reference to undefined global `" ^ s ^ "'"
  | Linking_error (name, Unavailable_primitive s) ->
      "error while linking " ^ name ^ ".\n" ^
      "The external function `" ^ s ^ "' is not available"
  | Linking_error (name, Uninitialized_global s) ->
      "error while linking " ^ name ^ ".\n" ^
      "The module `" ^ s ^ "' is not yet initialized"
  | Corrupted_interface name ->
      "corrupted interface file " ^ name
  | File_not_found name ->
      "cannot find file " ^ name ^ " in search path"
  | Cannot_open_dll reason ->
      "error loading shared library: " ^ reason
