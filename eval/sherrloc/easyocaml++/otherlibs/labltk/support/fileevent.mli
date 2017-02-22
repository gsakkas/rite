(***********************************************************************)
(*                                                                     *)
(*                 MLTk, Tcl/Tk interface of Objective Caml            *)
(*                                                                     *)
(*    Francois Rouaix, Francois Pessaux, Jun Furuse and Pierre Weis    *)
(*               projet Cristal, INRIA Rocquencourt                    *)
(*            Jacques Garrigue, Kyoto University RIMS                  *)
(*                                                                     *)
(*  Copyright 2002 Institut National de Recherche en Informatique et   *)
(*  en Automatique and Kyoto University.  All rights reserved.         *)
(*  This file is distributed under the terms of the GNU Library        *)
(*  General Public License, with the special exception on linking      *)
(*  described in file LICENSE found in the Objective Caml source tree. *)
(*                                                                     *)
(***********************************************************************)

(* $Id: fileevent.mli,v 1.7 2002/04/26 12:16:20 furuse Exp $ *)

open Unix

val   add_fileinput : fd:file_descr -> callback:(unit -> unit) -> unit
val   remove_fileinput: fd:file_descr -> unit
val   add_fileoutput : fd:file_descr -> callback:(unit -> unit) -> unit
val   remove_fileoutput: fd:file_descr -> unit
      (* see [tk] module *)
