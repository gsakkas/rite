(***********************************************************************)
(*                             OCamldoc                                *)
(*                                                                     *)
(*            Maxence Guesdon, projet Cristal, INRIA Rocquencourt      *)
(*                                                                     *)
(*  Copyright 2001 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: odoc_opt.ml,v 1.6 2006/09/20 11:14:37 doligez Exp $ *)

(** Main module for native version.*)

open Config
open Clflags
open Misc
open Format
open Typedtree

let _ = Odoc_args.bytecode_mode := false


let html_generator = new Odoc_html.html
let default_latex_generator = new Odoc_latex.latex
let default_texi_generator = new Odoc_texi.texi
let default_man_generator = new Odoc_man.man
let default_dot_generator = new Odoc_dot.dot
let _ = Odoc_args.parse
    (html_generator :> Odoc_args.doc_generator)
    (default_latex_generator :> Odoc_args.doc_generator)
    (default_texi_generator :> Odoc_args.doc_generator)
    (default_man_generator :> Odoc_args.doc_generator)
    (default_dot_generator :> Odoc_args.doc_generator)

let loaded_modules =
  List.flatten
    (List.map
       (fun f ->
         Odoc_info.verbose (Odoc_messages.loading f);
         try
           let l = Odoc_analyse.load_modules f in
           Odoc_info.verbose Odoc_messages.ok;
           l
         with Failure s ->
           prerr_endline s ;
           incr Odoc_global.errors ;
           []
       )
       !Odoc_args.load
    )

let modules = Odoc_analyse.analyse_files ~init: loaded_modules !Odoc_args.files

let _ =
  match !Odoc_args.dump with
    None -> ()
  | Some f ->
      try Odoc_analyse.dump_modules f modules
      with Failure s ->
        prerr_endline s ;
        incr Odoc_global.errors

let _ =
  match !Odoc_args.doc_generator with
    None ->
      ()
  | Some gen ->
      Odoc_info.verbose Odoc_messages.generating_doc;
      gen#generate modules;
      Odoc_info.verbose Odoc_messages.ok

let _ =
  if !Odoc_global.errors > 0 then
  (
   prerr_endline (Odoc_messages.errors_occured !Odoc_global.errors) ;
   exit 1
  )
  else
    exit 0
