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

(* $Id: odoc_config.ml,v 1.1.20.2 2007/03/07 08:50:24 xleroy Exp $ *)

let custom_generators_path =
  Filename.concat Config.standard_library
    (Filename.concat "ocamldoc" "custom")

let print_warnings = ref true
