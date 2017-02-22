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


module Make (Structure : Structure.S) = struct
  module Tools  = Tools.Make Structure;
  module Search = Search.Make Structure;
  module Print  = Print.Make Structure;
  module C = Sig.Grammar.ParseErrorTs;
  open Structure;
  open Format;

module SymbolDescCreator = struct
  include Structure.ParseError.SymbolDesc;
  value of_symbol entry = fun
    [ Snterm e -> C.Entry (e.ename, None)
    | Snterml e l -> C.Entry (e.ename, Some l)
    | Sself | Snext -> C.Entry (entry.ename, None)
    | Stoken (_, descr) -> C.Token descr
    | Skeyword kwd -> C.Keyword kwd
    | _ -> C.Unknown ];
end;

module ExpectedCreator = struct
  include Structure.ParseError.Expected;
  value or_append exp1 exp2 =
    match (exp1, exp2) with
      [ (C.Or_list exps1, C.Or_list exps2) -> C.Or_list (List.append exps1 exps2)
      | _ -> C.Or_list [exp1; exp2] ];
  value rec of_symbol entry =
    fun
    [ Slist0 s -> of_symbol entry s
    | Slist0sep s _ -> of_symbol entry s
    | Slist1 s -> of_symbol entry s
    | Slist1sep s _ -> of_symbol entry s
    | Sopt s -> of_symbol entry s
    | Stree t -> of_tree entry t
    | s -> C.Symbol (SymbolDescCreator.of_symbol entry s) ]
  and of_tree entry =
    fun
    [ Node {node = s; brother = bro; son = son} ->
        let tokl =
          match s with
          [ Stoken _ | Skeyword _ -> Tools.get_token_list entry [] s son
          | _ -> None ]
        in
        match tokl with
        [ None ->
            let txt = of_symbol entry s in
            let txt =
              match (s, son) with
              [ (Sopt _, Node _) -> or_append txt (of_tree entry son)
              | _ -> txt ]
            in
            let txt =
              match bro with
              [ DeadEnd | LocAct _ _ -> txt
              | Node _ -> or_append txt (of_tree entry bro) ]
            in
            txt
        | Some (tokl, _, _) ->
            let f = fun [ Stoken (_, str) | Skeyword str -> str | _ -> assert False ] in
            C.Then_list (List.map f tokl) ]
    | DeadEnd | LocAct _ _ -> C.Symbol C.Unknown ]
  ;
end;

module ParseError = struct

  include Structure.ParseError;

  value as_stream_error: error -> exn =
    fun err ->
      Stream.Error (encode err);

  value illegal_begin: internal_entry -> error =
    fun entry ->
      Illegal_begin (C.Entry (entry.ename, None));

  value magic _s x = debug magic "Obj.magic: %s@." _s in Obj.magic x;
  value of_failed_tree entry prev_symb_result prev_symb tree =
    let exp = ExpectedCreator.of_tree entry tree in
    let (exp, after) =
      match prev_symb with
      [ Slist0 s ->
          let exp1 = ExpectedCreator.of_symbol entry s in
          (ExpectedCreator.or_append exp1 exp, None)
      | Slist1 s ->
          let exp1 = ExpectedCreator.of_symbol entry s in
          (ExpectedCreator.or_append exp1 exp, None)
      | Slist0sep s sep ->
          match magic "tree_failed: 'a -> list 'b" prev_symb_result with
          [ [] ->
              let exp1 = ExpectedCreator.of_symbol entry s in
              (ExpectedCreator.or_append exp1 exp, None)
          | _ ->
              let exp1 = ExpectedCreator.of_symbol entry sep in
              (ExpectedCreator.or_append exp1 exp, None) ]
      | Slist1sep s sep ->
          match magic "tree_failed: 'a -> list 'b" prev_symb_result with
          [ [] ->
              let exp1 = ExpectedCreator.of_symbol entry s in
              (ExpectedCreator.or_append exp1 exp, None)
          | _ ->
              let exp1 = ExpectedCreator.of_symbol entry sep in
              (ExpectedCreator.or_append exp1 exp, None) ]
      | Sopt _ | Stree _ -> (exp, None)
      | _ -> (exp, Some (SymbolDescCreator.of_symbol entry prev_symb)) ]
    in
    do {
      if entry.egram.error_verbose.val then do {
        let tree = Search.tree_in_entry prev_symb tree entry.edesc;
        let ppf = err_formatter;
        fprintf ppf "@[<v 0>@,";
        fprintf ppf "----------------------------------@,";
        fprintf ppf "Parse error in entry [%s], rule:@;<0 2>" entry.ename;
        fprintf ppf "@[";
        Print.print_level ppf pp_force_newline (Print.flatten_tree tree);
        fprintf ppf "@]@,";
        fprintf ppf "----------------------------------@,";
        fprintf ppf "@]@."
      }
      else ();
      Expected (exp, after, entry.ename)
    }
  ;
  value of_failed_symbol entry prev_symb_result prev_symb symb =
    let tree = Node {node = symb; brother = DeadEnd; son = DeadEnd} in
    of_failed_tree entry prev_symb_result prev_symb tree;
  value of_failed_symbol_txt e s1 s2 =
    of_failed_symbol e 0 s1 s2;
end;

(*
value rec name_of_symbol entry symbol = SymbolDescCreator.to_string (SymbolDescCreator.of_symbol entry symbol);

value name_of_tree_failed entry symbol = ExpectedCreator.to_string (ExpectedCreator.of_symbol entry symbol);
value tree_failed entry prev_symb_result prev_symb tree =
  ParseError.to_string (ParseError.of_failed_tree entry prev_symb_result prev_symb tree);
value symb_failed entry prev_symb_result prev_symb symb =
  let tree = Node {node = symb; brother = DeadEnd; son = DeadEnd} in
  tree_failed entry prev_symb_result prev_symb tree
;

value symb_failed_txt e s1 s2 = symb_failed e 0 s1 s2;
 *)

end;
