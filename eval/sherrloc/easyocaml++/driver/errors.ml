(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*            Xavier Leroy, projet Cristal, INRIA Rocquencourt         *)
(*                                                                     *)
(*  Copyright 1996 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: errors.ml,v 1.26 2006/01/04 16:55:49 doligez Exp $ *)

(* WARNING: if you change something in this file, you must look at
   opterrors.ml to see if you need to make the same changes there.
*)

open Format

(* Report an error *)
  
let original_report ppf = function
| Lexer.Error(err, loc) ->
    Location.print ppf loc;
    Lexer.report_error ppf err
| Syntaxerr.Error err ->
    Syntaxerr.report_error ppf err
| Pparse.Error ->
    fprintf ppf "Preprocessor error"
| Env.Error err ->
    Env.report_error ppf err
| Ctype.Tags(l, l') -> fprintf ppf
    "In this program,@ variant constructors@ `%s and `%s@ \
     have the same hash value.@ Change one of them." l l'
| Typecore.Error(loc, err) ->
    Location.print ppf loc; Typecore.report_error ppf err
| Typetexp.Error(loc, err) ->
    Location.print ppf loc; Typetexp.report_error ppf err
| Typedecl.Error(loc, err) ->
    Location.print ppf loc; Typedecl.report_error ppf err
| Typeclass.Error(loc, err) ->
    Location.print ppf loc; Typeclass.report_error ppf err
| Includemod.Error err ->
    Includemod.report_error ppf err
| Typemod.Error(loc, err) ->
    Location.print ppf loc; Typemod.report_error ppf err
| Translcore.Error(loc, err) ->
    Location.print ppf loc; Translcore.report_error ppf err
| Translclass.Error(loc, err) ->
    Location.print ppf loc; Translclass.report_error ppf err
| Translmod.Error(loc, err) ->
    Location.print ppf loc; Translmod.report_error ppf err
| Symtable.Error code ->
    Symtable.report_error ppf code
| Bytelink.Error code ->
    Bytelink.report_error ppf code
| Bytelibrarian.Error code ->
    Bytelibrarian.report_error ppf code
| Bytepackager.Error code ->
    Bytepackager.report_error ppf code
| EzyErrors.AnnotatedError an_err ->
    EzyErrors.report_annotated_errors ppf an_err
| EzyErrors.Fatal fatal_info ->
    EzyErrors.report_fatal ppf fatal_info
(* | EzyCamlgrammar.E (loc, program, error) -> *)
(*     EzyErrors.report_parse_error ppf loc program error *)
| Stream.Error code ->
    failwith "Pure Stream.Error"
| Sys_error msg ->
    fprintf ppf "I/O error: %s" msg
| Warnings.Errors (n) ->
    fprintf ppf "@.Error: error-enabled warnings (%d occurrences)" n
| x ->
    fprintf ppf "@]";
    raise x

let report = ref original_report

let report_error ppf exn =
  fprintf ppf "@[" ;
  fprintf ppf "%a@]@." !report exn
