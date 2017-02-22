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

(* $Id: envaux.ml,v 1.7 2000/03/06 22:11:17 weis Exp $ *)

open Misc
open Types
open Env

type error =
    Module_not_found of Path.t

exception Error of error

let env_cache =
  (Hashtbl.create 59 : (Env.summary, Env.t) Hashtbl.t)

let reset_cache () =
  Hashtbl.clear env_cache;
  Env.reset_cache()

let extract_sig env mty =
  match Mtype.scrape env mty with
    Tmty_signature sg -> sg
  | _ -> fatal_error "Envaux.extract_sig"

let rec env_from_summary sum =
  try
    Hashtbl.find env_cache sum
  with Not_found ->
    let env =
      match sum with
        Env_empty ->
          Env.empty
      | Env_value(s, id, desc) ->
          Env.add_value id desc (env_from_summary s)
      | Env_type(s, id, desc) ->
          Env.add_type id desc (env_from_summary s)
      | Env_exception(s, id, desc) ->
          Env.add_exception id desc (env_from_summary s)
      | Env_module(s, id, desc) ->
          Env.add_module id desc (env_from_summary s)
      | Env_modtype(s, id, desc) ->
          Env.add_modtype id desc (env_from_summary s)
      | Env_class(s, id, desc) ->
          Env.add_class id desc (env_from_summary s)
      | Env_cltype (s, id, desc) ->
          Env.add_cltype id desc (env_from_summary s)
      | Env_open(s, path) ->
          let env = env_from_summary s in
          let mty =
            try 
              Env.find_module path env
            with Not_found ->
              raise (Error (Module_not_found path))
          in
          Env.open_signature path (extract_sig env mty) env
    in
      Hashtbl.add env_cache sum env;
      env

let env_of_event =
  function
    None    -> Env.empty
  | Some ev -> env_from_summary ev.Instruct.ev_typenv

(* Error report *)

open Format

let report_error ppf = function
  | Module_not_found p ->
      fprintf ppf "@[Cannot find module %a@].@." Printtyp.path p
