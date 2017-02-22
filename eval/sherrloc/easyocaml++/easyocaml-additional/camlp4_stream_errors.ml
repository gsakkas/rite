
(* Parse errors for OCaml that are detected manually (ignoring errors for grammars) *)
type ocaml_parse_error =
  | Currified_constructor
    (* Camlp4Parsers/Camlp4OCamlParser.Make(_).is_expr_constr_call *)
  | Not_an_identifier of Camlp4Ast.NotAnIdentifier.t
    (* Camlp4/Struct/Camlp4Ast.mlast.ident_of_(expr|ctyp|patt) *)
  | Bad_directive of string
    (* Caml4pBin.ml.parse_file *)

type camlp4_parse_error =
  | Illegal_begin of Gram.intername_entry
    (* Camlp4/Struct/Grammar/Entry.Make(_).action_parse *)
  | Fold1sep_fail
    (* Camlp4/Struct/Grammar/Fold.Make(_).sfold1sep *)
  | Tree_failed of Gram.intername_entry * Gram.symbol * Gram.symbol * Gram.tree
    (* Camlp4/Struct/Grammar/Parser.Make(_).recover,parser_cont *)
  | Symb_failed of Gram.intername_entry * Gram.symbol * Gram.symbol * Gram.symbol
    (* Camlp4/Struct/Grammar/Parser.Make(_).parser_of_symbol *)
  | Ocaml_parse_error of ocaml_parse_error


let describe_ocaml_parse_error = function
  | Currified_constructor ->
      "currified constructor"
  | Expr_not_an_identifier ->
      "ident_of_expr: this expression is not an identifier"
  | Ctyp_not_an_identifier ->
      "ident_of_ctyp: this type is not an identifier"
  | Patt_not_an_identifier ->
      "ident_of_patt: this pattern is not an identifier"
  | Bad_directive _ ->
      "bad directive"

let describe_camlp4_parse_error =
  let module Fail = Failed.Make (Gram) in
  function
    | Illegal_begin entry ->
        "illegal begin of " ^ entry.Gram.ename
    | Fold1sep_fail ->
        "failed"
    | Tree_failed (entry, prev_symb_result, prev_symb, tree) ->
        Fail.tree_failed entry prev_symb_result prev_symb tree
    | Symb_failed (entry, prev_symb_result, prev_symb, symb) ->
        Fail.symb_failed entry prev_symb_result prev_symb symb in
    | Ocaml_parse_error err ->
        describe_ocaml_parse_error err


let camlp4_raise err =
  raise (Stream.Error (Marshal.to_string err [])

(* or *)

let g_camlp4_parse_error : camlp4_parse_error option = ref None
let camlp4_raise err =
  g_camlp4_parse_error := Some err ;
  raise (Stream.Error (describe_camlp4_parse_error err))

