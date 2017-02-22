(****************************************************************************)
(*                                                                          *)
(*                              Objective Caml                              *)
(*                                                                          *)
(*                            INRIA Rocquencourt                            *)
(*                                                                          *)
(*  Copyright  2006   Institut National de Recherche  en  Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed under   *)
(*  the terms of the GNU Library General Public License, with the special   *)
(*  exception on linking described in LICENSE at the top of the Objective   *)
(*  Caml source tree.                                                       *)
(*                                                                          *)
(****************************************************************************)

(* Authors:
 * - Daniel de Rauglaudre: initial version
 * - Nicolas Pouillard: refactoring
 *)

module Id = struct
  value name = "Camlp4.Printers.Null";
  value version = "$Id: Null.ml,v 1.2 2007/02/07 10:09:21 ertai Exp $";
end;

module Make (Syntax : Sig.Syntax) = struct
  include Syntax;
  
  value print_interf ?input_file:(_) ?output_file:(_) _ = ();
  value print_implem ?input_file:(_) ?output_file:(_) _ = ();
end;
