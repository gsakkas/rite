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

(* $Id: compile.ml,v 1.58 2005/08/08 09:41:51 xleroy Exp $ *)

(* The batch compiler *)

open Misc
open Config
open Format
open Typedtree

let log = new EzyUtils.Logger.logger "compile"

(* Initialize the search path.
   The current directory is always searched first,
   then the directories specified with the -I option (in command-line order),
   then the standard library directory (unless the -nostdlib option is given).
 *)

let init_path () =
  let dirs =
    if !Clflags.use_threads then "+threads" :: !Clflags.include_dirs
    else if !Clflags.use_vmthreads then "+vmthreads" :: !Clflags.include_dirs
    else !Clflags.include_dirs in
  let exp_dirs =
    List.map (expand_directory Config.standard_library) dirs in
  load_path := "" :: List.rev_append exp_dirs (Clflags.std_include_dir ());
  Env.reset_cache ()

(* Return the initial environment in which compilation proceeds. *)

(* Note: do not do init_path() in initial_env, this breaks
   toplevel initialization (PR#1775) *)
let easy_initial_env easy =
  Ident.reinit();
  match easy.EzySetup.modules with
    | None -> (
        try
          if !Clflags.nopervasives
          then Env.initial
          else Env.open_pers_signature "Pervasives" Env.initial
        with Not_found ->
          fatal_error "cannot open pervasives.cmi"
      )
    | Some ms ->
        let open_mod m env = 
          try Env.open_pers_signature m env 
          with Not_found ->
            log#error "Could not find module %s in load_path %a" m (EzyUtils.List.print pp_print_string ", ") !Config.load_path;
            fatal_error ("Module not found: " ^ m)
        in
          EzyEnv.allow_modules (List.map fst ms);
          List.fold_left (fun env (m,o) -> if o then open_mod m env else env) Env.initial ms

let initial_env () = easy_initial_env EzySetup.default

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
    let sg = Typemod.transl_signature (initial_env ()) ast in
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

let implementation ppf sourcefile outputprefix =
  init_path ();
  let easy = EzySetup.setup () in
  let modulename =
    String.capitalize(Filename.basename(chop_extension_if_any sourcefile)) in
  Env.set_unit_name modulename;
  let inputfile = Pparse.preprocess sourcefile in
  let env = easy_initial_env easy in
  if !Clflags.print_types then begin
    try ignore(
      Pparse.file ppf inputfile Parse.implementation ast_impl_magic_number
      ++ print_if ppf Clflags.dump_parsetree Printast.implementation
      ++ Typemod.type_implementation sourcefile outputprefix modulename env)
    with x ->
      Pparse.remove_preprocessed_if_ast inputfile;
      raise x
  end else begin    
    let objfile = outputprefix ^ ".cmo" in
    let oc = open_out_bin objfile in
    let program = lazy (
      let ic = open_in inputfile in
      EzyUtils.between EzyUtils.input_all ic (fun _ -> close_in ic)
    ) in
    let parse inputfile ast_impl_magic_number =
      match easy.EzySetup.features with
        | Some fs -> 
            EzyErrors.wrap_exception_with_program program
              (fun () -> EzyCamlgrammar.restrict_and_parse_implem fs inputfile ast_impl_magic_number)
        | None ->
            Pparse.file ppf inputfile Parse.implementation ast_impl_magic_number in

    let typecheck parse_tree : Typedtree.structure * Typedtree.module_coercion =
      match easy.EzySetup.features with
        | Some fs -> 
            let res = EzyErrors.wrap_exception_with_program program
              (fun () -> EzyTyping.type_and_compare_implementation sourcefile outputprefix modulename env parse_tree fs) in
            (* EzyErrors.report_valid Format.err_formatter program ted_str;
            if try Sys.getenv "EASYOCAML_ONLY_TYPECHECK" = "yes" with Not_found -> false then
              exit 0;*)
            res
        | None ->
            Typemod.type_implementation sourcefile outputprefix modulename env parse_tree in

    try
      parse inputfile ast_impl_magic_number
      ++ print_if ppf Clflags.dump_parsetree Printast.implementation
      ++ Unused_var.warn ppf
      ++ typecheck
      (* here goes a [Typedtree.structure * Typedtree.module_coercion] *)
      ++ Translmod.transl_implementation modulename
      ++ print_if ppf Clflags.dump_rawlambda Printlambda.lambda
      ++ Simplif.simplify_lambda
      ++ print_if ppf Clflags.dump_lambda Printlambda.lambda
      ++ Bytegen.compile_implementation modulename
      ++ print_if ppf Clflags.dump_instr Printinstr.instrlist
      ++ Emitcode.to_file oc modulename;
      Warnings.check_fatal ();
      Pparse.remove_preprocessed inputfile;
      close_out oc;
    with x ->
      close_out oc;
      remove_file objfile;
      Pparse.remove_preprocessed_if_ast inputfile;
      raise x
  end

let c_file name =
  if Ccomp.compile_file name <> 0 then exit 2
