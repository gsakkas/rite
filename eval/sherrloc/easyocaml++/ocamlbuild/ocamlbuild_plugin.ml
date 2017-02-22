(***********************************************************************)
(*                             ocamlbuild                              *)
(*                                                                     *)
(*  Nicolas Pouillard, Berke Durak, projet Gallium, INRIA Rocquencourt *)
(*                                                                     *)
(*  Copyright 2007 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: ocamlbuild_plugin.ml,v 1.2.2.5 2007/11/28 17:03:54 ertai Exp $ *)
(* Original author: Nicolas Pouillard *)

open Ocamlbuild_pack
include Ocamlbuild_pack.My_std
module Arch = Ocamlbuild_pack.Ocaml_arch
module Command = Ocamlbuild_pack.Command
module Pathname = Ocamlbuild_pack.Pathname
module Tags = Ocamlbuild_pack.Tags
include Pathname.Operators
include Tags.Operators
module Rule = Ocamlbuild_pack.Rule
module Options = Ocamlbuild_pack.Options
type command = Command.t = Seq of command list | Cmd of spec | Echo of string list * string | Nop
and spec = Command.spec =
  | N | S of spec list | A of string | P of string | Px of string
  | Sh of string | T of Tags.t | V of string | Quote of spec
include Rule.Common_commands
type env = Pathname.t -> Pathname.t
type builder = Pathname.t list list -> (Pathname.t, exn) Ocamlbuild_pack.My_std.Outcome.t list
type action = env -> builder -> Command.t
let rule = Rule.rule
let dep = Rule.dep
let copy_rule = Rule.copy_rule
let ocaml_lib = Ocamlbuild_pack.Ocaml_utils.ocaml_lib
let flag = Ocamlbuild_pack.Flags.flag
let non_dependency = Ocamlbuild_pack.Ocaml_utils.non_dependency
let use_lib = Ocamlbuild_pack.Ocaml_utils.use_lib
let module_name_of_pathname = Ocamlbuild_pack.Ocaml_utils.module_name_of_pathname
let string_list_of_file = Ocamlbuild_pack.Ocaml_utils.string_list_of_file
let expand_module = Ocamlbuild_pack.Ocaml_utils.expand_module
let tags_of_pathname = Ocamlbuild_pack.Tools.tags_of_pathname
let hide_package_contents = Ocamlbuild_pack.Ocaml_compiler.hide_package_contents
let tag_file = Ocamlbuild_pack.Configuration.tag_file
let tag_any = Ocamlbuild_pack.Configuration.tag_any
type hook = Ocamlbuild_pack.Hooks.message =
  | Before_hygiene
  | After_hygiene
  | Before_options
  | After_options
  | Before_rules
  | After_rules
let dispatch = Ocamlbuild_pack.Hooks.setup_hooks
