
(** This module provides some EasyOCaml specific miscellaneous functions:
  *  - registering error printer: used in driver/ and toplevel/
  *)

open EzyUtils
open EzyUtils.Infix

let logger = new Logger.logger "StructuredErrorReport"

let register_error_printer : string -> unit =
  fun str ->
    if String.check_suffix str ".cmo" then
      begin try 
        logger#info "Loading error reporting plugin %s" str ;
        Dynlink.init () ;
        Dynlink.loadfile str ;
      with Dynlink.Error err ->
       Misc.fatal_error (Dynlink.error_message err);
      end
    else
      Misc.fatal_error ("Not a valid error printer: " ^ str ^ " (must be an OCaml object file, calling EzyErrors.register")
