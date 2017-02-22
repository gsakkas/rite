(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*            Xavier Leroy, projet Cristal, INRIA Rocquencourt         *)
(*                                                                     *)
(*  Copyright 2002 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: optcompile.ml,v 1.53 2005/08/08 09:41:51 xleroy Exp $ *)

(* The batch compiler *)

open Misc
open Config
open Format
open Typedtree

(* Initialize the search path.
   The current directory is always searched first,
   then the directories specified with the -I option (in command-line order),
   then the standard library directory. *)

let init_path () =
  let dirs =
    if !Clflags.use_threads
    then "+threads" :: !Clflags.include_dirs
    else !Clflags.include_dirs in
  let exp_dirs =
    List.map (expand_directory Config.standard_library) dirs in
  load_path := "" :: List.rev_append exp_dirs (Clflags.std_include_dir ());
  Env.reset_cache ()

(* Return the initial environment in which compilation proceeds. *)

let initial_env () =
  Ident.reinit();
  try
    if !Clflags.nopervasives
    then Env.initial
    else Env.open_pers_signature "Pervasives" Env.initial
  with Not_found ->
    fatal_error "cannot open Pervasives.cmi"

(* Compile a .mli file *)

let interface ppf sourcefile outputprefix =
  init_path ();
  let modulename =
    String.capitalize(Filename.basename(chop_extension_if_any sourcefile)) in
  Env.set_unit_name modulename;
  let inputfile = Pparse.preprocess sourcefile in
  try
    let ast =
      Pparse.file ppf inputfile Parse.interface ast_intf_magic_number in
    if !Clflags.dump_parsetree then fprintf ppf "%a@." Printast.interface ast;
    let sg = Typemod.transl_signature (initial_env()) ast in
    if !Clflags.print_types then
      fprintf std_formatter "%a@." Printtyp.signature
                                   (Typemod.simplify_signature sg);
    Warnings.check_fatal ();
    if not !Clflags.print_types then
      Env.save_signature sg modulename (outputprefix ^ ".cmi");
    Pparse.remove_preprocessed inputfile
  with e ->
    Pparse.remove_preprocessed_if_ast inputfile;
    raise e

(* Compile a .ml file *)

let print_if ppf flag printer arg =
  if !flag then fprintf ppf "%a@." printer arg;
  arg

let (++) x f = f x
let (+++) (x, y) f = (x, f y)

let implementation ppf sourcefile outputprefix =
  init_path ();
  let modulename =
    String.capitalize(Filename.basename(chop_extension_if_any sourcefile)) in
  Env.set_unit_name modulename;
  let inputfile = Pparse.preprocess sourcefile in
  let env = initial_env() in
  Compilenv.reset ?packname:!Clflags.for_package modulename;
  try
    if !Clflags.print_types then ignore(
      Pparse.file ppf inputfile Parse.implementation ast_impl_magic_number
      ++ print_if ppf Clflags.dump_parsetree Printast.implementation
      ++ Unused_var.warn ppf
      ++ Typemod.type_implementation sourcefile outputprefix modulename env)
    else begin
      Pparse.file ppf inputfile Parse.implementation ast_impl_magic_number
      ++ print_if ppf Clflags.dump_parsetree Printast.implementation
      ++ Unused_var.warn ppf
      ++ Typemod.type_implementation sourcefile outputprefix modulename env
      ++ Translmod.transl_store_implementation modulename
      +++ print_if ppf Clflags.dump_rawlambda Printlambda.lambda
      +++ Simplif.simplify_lambda
      +++ print_if ppf Clflags.dump_lambda Printlambda.lambda
      ++ Asmgen.compile_implementation outputprefix ppf;
      Compilenv.save_unit_info (outputprefix ^ ".cmx");
    end;
    Warnings.check_fatal ();
    Pparse.remove_preprocessed inputfile
  with x ->
    Pparse.remove_preprocessed_if_ast inputfile;
    raise x

let c_file name =
  if Ccomp.compile_file name <> 0 then exit 2
