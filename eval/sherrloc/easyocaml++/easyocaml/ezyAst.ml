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

(* $Id: parsetree.mli,v 1.43 2006/04/05 02:28:13 garrigue Exp $ *)

(* Abstract syntax tree produced by parsing *)

open EzyOcamlmodules
open EzyUtils
open EzyAsttypes

exception InternalDotsError of string

(* Value expressions for the core language *)

type 'lid_data longident =
    {
      lid_name: Longident.t ;
      lid_data: 'lid_data ;
    }

type 'name_data name =
    {
      nm_name: string ;
      nm_loc: Location.t ;
      nm_data: 'name_data ;
    }

let enrich_name ?ident nm = 
  let data =
    match ident with
      | None -> Ident.create nm.nm_name
      | Some id -> id in
  {
    nm_name = nm.nm_name ;
    nm_loc = nm.nm_loc ;
    nm_data = data ;
  }

type core_type = Parsetree.core_type =
  { ptyp_desc: core_type_desc;
    ptyp_loc: Location.t }

and core_type_desc = Parsetree.core_type_desc =
    Ptyp_any
  | Ptyp_var of string
  | Ptyp_arrow of label * core_type * core_type
  | Ptyp_tuple of core_type list
  | Ptyp_constr of Longident.t * core_type list
  | Ptyp_object of Parsetree.core_field_type list
  | Ptyp_class of Longident.t * core_type list * label list
  | Ptyp_alias of core_type * string
  | Ptyp_variant of Parsetree.row_field list * bool * label list option
  | Ptyp_poly of string list * core_type

type 'nm_data type_kind =
  | Abstract
  | Synonym of core_type
  | Variant of (string * core_type list * Location.t) list
  | Record of (string * EzyAsttypes.mutable_flag * core_type * Location.t) list

type 'nm_data type_declaration = {
  type_params : 'nm_data name list ;
  type_kind : 'nm_data type_kind ;
}

type ('expr_data,'id_data, 'nm_data, 'pat_data) pattern =
  { ppat_desc: ('expr_data,'id_data, 'nm_data, 'pat_data) pattern_desc;
    ppat_loc: Location.t ;
    ppat_data: 'pat_data
  }

and ('expr_data, 'id_data, 'nm_data, 'pat_data) pattern_desc =
  | Ppat_any 
  | Ppat_var of 'nm_data name
  | Ppat_constant of constant
  | Ppat_tuple of ('expr_data, 'id_data, 'nm_data, 'pat_data) pattern list
  | Ppat_construct of 'id_data longident * ('expr_data, 'id_data, 'nm_data, 'pat_data) pattern option * bool
  | Ppat_record of ('id_data longident * ('expr_data, 'id_data, 'nm_data, 'pat_data) pattern) list
  | Ppat_or of ('expr_data, 'id_data, 'nm_data, 'pat_data) pattern * ('expr_data, 'id_data, 'nm_data, 'pat_data) pattern
  | Ppat_constraint of ('expr_data,'id_data, 'nm_data, 'pat_data) pattern * core_type
  | Ppat_alias of ('expr_data,'id_data, 'nm_data, 'pat_data) pattern * 'nm_data name
  | Ppat_dots of ('expr_data, 'id_data, 'nm_data, 'pat_data) dot_item list
(*| Ppat_array of 'pat_data pattern list*)
and ('expr_data, 'id_data, 'nm_data, 'pat_data) expression =
  { pexp_desc: ('expr_data, 'id_data, 'nm_data, 'pat_data) expression_desc;
    pexp_loc: Location.t ;
    pexp_data: 'expr_data ;
  }
and ('expr_data, 'id_data, 'nm_data, 'pat_data) rule =
  ('expr_data,'id_data, 'nm_data, 'pat_data) pattern * ('expr_data, 'id_data, 'nm_data, 'pat_data) expression
and ('expr_data, 'id_data, 'nm_data, 'pat_data) expression_desc =
  | Pexp_ident of 'id_data longident
  | Pexp_constant of constant
  | Pexp_let of 
      (('expr_data,'id_data, 'nm_data, 'pat_data) pattern * ('expr_data, 'id_data, 'nm_data, 'pat_data) expression) list *
      ('expr_data, 'id_data, 'nm_data, 'pat_data) expression 
  | Pexp_letrec of 
      ('nm_data name * ('expr_data, 'id_data, 'nm_data, 'pat_data) expression) list * 
      ('expr_data, 'id_data, 'nm_data, 'pat_data) expression 
  | Pexp_function of
      ('expr_data, 'id_data, 'nm_data, 'pat_data) rule list
  | Pexp_apply of
      ('expr_data, 'id_data, 'nm_data, 'pat_data) expression * 
      ('expr_data, 'id_data, 'nm_data, 'pat_data) expression

  | Pexp_match of ('expr_data, 'id_data, 'nm_data, 'pat_data) expression *
                  ('expr_data, 'id_data, 'nm_data, 'pat_data) rule list
  | Pexp_try of ('expr_data, 'id_data, 'nm_data, 'pat_data) expression *
                ('expr_data, 'id_data, 'nm_data, 'pat_data) rule list
  | Pexp_tuple of ('expr_data, 'id_data, 'nm_data, 'pat_data) expression list 
  | Pexp_construct of 'id_data longident * ('expr_data, 'id_data, 'nm_data, 'pat_data) expression option * bool
    (* The last construal of Pexp_construct is an [explicit_arity] tag for the parsetree and and
     * tag if a tuple as the second construal contains should be understood as a list for the typedtree. *)

  | Pexp_record of ('id_data longident * ('expr_data, 'id_data, 'nm_data, 'pat_data) expression) list *
                   ('expr_data, 'id_data, 'nm_data, 'pat_data) expression option 
  | Pexp_field of ('expr_data, 'id_data, 'nm_data, 'pat_data) expression * 'id_data longident
  | Pexp_setfield of ('expr_data, 'id_data, 'nm_data, 'pat_data) expression *
                     'id_data longident * ('expr_data, 'id_data, 'nm_data, 'pat_data) expression 
  | Pexp_ifthenelse of ('expr_data, 'id_data, 'nm_data, 'pat_data) expression *
                       ('expr_data, 'id_data, 'nm_data, 'pat_data) expression *
                       ('expr_data, 'id_data, 'nm_data, 'pat_data) expression option 
  | Pexp_sequence of ('expr_data, 'id_data, 'nm_data, 'pat_data) expression *
                     ('expr_data, 'id_data, 'nm_data, 'pat_data) expression 
  | Pexp_while of ('expr_data, 'id_data, 'nm_data, 'pat_data) expression *
                  ('expr_data, 'id_data, 'nm_data, 'pat_data) expression 
  | Pexp_for of 'nm_data name * ('expr_data, 'id_data, 'nm_data, 'pat_data) expression *
                ('expr_data, 'id_data, 'nm_data, 'pat_data) expression *
                direction_flag * ('expr_data, 'id_data, 'nm_data, 'pat_data) expression 
  | Pexp_assert of ('expr_data, 'id_data, 'nm_data, 'pat_data) expression
  | Pexp_assertfalse 
  | Pexp_constraint of ('expr_data, 'id_data, 'nm_data, 'pat_data) expression * core_type
  | Pexp_dots of ('expr_data, 'id_data, 'nm_data, 'pat_data) dot_item list

and ('expr_data, 'id_data, 'nm_data, 'pat_data) structure =
  ('expr_data, 'id_data, 'nm_data, 'pat_data) structure_item list

and ('expr_data, 'id_data, 'nm_data, 'pat_data) structure_item =
  { pstr_desc: ('expr_data, 'id_data, 'nm_data, 'pat_data) structure_item_desc;
    pstr_loc: Location.t }

and ('expr_data, 'id_data, 'nm_data, 'pat_data) structure_item_desc =
  | Pstr_eval of ('expr_data, 'id_data, 'nm_data, 'pat_data) expression
  | Pstr_value of (('expr_data, 'id_data, 'nm_data, 'pat_data) pattern 
                   * ('expr_data, 'id_data, 'nm_data, 'pat_data) expression) list
  | Pstr_rec_value of ('nm_data name * ('expr_data, 'id_data, 'nm_data, 'pat_data) expression) list
  | Pstr_type of ('nm_data name * 'nm_data type_declaration) list  
  | Pstr_exception of 'nm_data name * core_type list
  | Pstr_open of 'id_data longident 
  | Pstr_dots of  ('expr_data, 'id_data, 'nm_data, 'pat_data) dot_item list

and ('expr_data, 'id_data, 'nm_data, 'pat_data) dot_item =
  | Dot_str of ('expr_data, 'id_data, 'nm_data, 'pat_data) structure_item
  | Dot_exp of ('expr_data, 'id_data, 'nm_data, 'pat_data) expression
  | Dot_pat of ('expr_data, 'id_data, 'nm_data, 'pat_data) pattern


type imported_expression = (unit, unit, unit, unit) expression
type imported_structure = (unit, unit, unit, unit) structure
type imported_structure_item = (unit, unit, unit, unit) structure_item
type imported_pattern = (unit,unit, unit, unit) pattern
type imported_rule = (unit, unit, unit, unit) rule

let rec variables_in_pattern p =
  match p.ppat_desc with
    | Ppat_any 
    | Ppat_construct (_, None, _)
    | Ppat_constant _ ->
        []
    | Ppat_var v ->
        [p.ppat_loc, v]
    | Ppat_tuple ps ->
        List.concat (List.map variables_in_pattern ps)
    | Ppat_constraint (p, _)
    | Ppat_construct (_, Some p, _)
    | Ppat_alias (p, _) ->
        variables_in_pattern p
    | Ppat_record fs ->
        List.concat (List.map (fun (_, p) -> variables_in_pattern p) fs)
    | Ppat_or (p1, p2) ->
        List.rev_append (variables_in_pattern p1) (variables_in_pattern p2)
    | Ppat_dots ps -> 
        raise (InternalDotsError "Not implemented for Ppat_dots!")



(******************************************************************************)
(*                                  PRINTER                                   *)
(******************************************************************************)


open Format

let rec print_core_type ppf ct =
  match ct.ptyp_desc with
    | Ptyp_any ->
        pp_print_string ppf "_"
    | Ptyp_var v -> fprintf ppf "'%s" v
    | Ptyp_arrow  ("", ct1, ct2) ->
        fprintf ppf "@[<h 2>(%a -> %a)@]" print_core_type ct1 print_core_type ct2
    | Ptyp_tuple cts ->
        fprintf ppf "@[<h 2>(%a)@]" (List.print print_core_type ", ") cts
    | Ptyp_constr (k, cts) ->
        let aux ppf =
          match cts with
            | [] -> ()
            | [ct] -> fprintf ppf "%a " print_core_type ct
            | cts -> fprintf ppf "@[<h 2>(%a)@] " (List.print print_core_type ", ") cts in
        fprintf ppf "%t%a" aux Longident.print k
    | Ptyp_poly ([], ct) ->
        print_core_type ppf ct
    | Ptyp_poly  _ | Ptyp_arrow _ | Ptyp_object  _
    | Ptyp_class _ | Ptyp_alias _ | Ptyp_variant _
      -> invalid_arg "print_core_type"

let print_type_kind ppf = function
  | Abstract -> pp_print_string ppf "<abstr>"
  | Synonym ct ->
      Printast.core_type 0 ppf ct
  | Variant vs ->
      let p ppf (k, tys, _) =
        let aux ppf = function
          | [] -> ()
          | tys -> fprintf ppf "<2> of %a" (List.print print_core_type " * ") tys in
        fprintf ppf "@[<h 2>%s%a@]" k aux tys in
      fprintf ppf "@[<h 2>%a@]" (List.print p " | ") vs
  | Record fls ->
      let aux ppf (f, m, ty, _) =
        let m' = if m = Mutable then "mutable " else "" in
        fprintf ppf "@[<h 2>%s : %s%a@]" f m' print_core_type ty in
      fprintf ppf "@[<h 2>{%a}@]" (List.print aux "; ") fls

let print_type_declaration ppf td =
  let f1 ppf =
    if td.type_params = []
    then ()
    else List.print (fun ppf name -> fprintf ppf "'%s" name.nm_name) ", " ppf td.type_params in
  fprintf ppf "%t . %a" f1 print_type_kind td.type_kind


let print_wrap = function
  | Some pp -> (fun ppf x -> fprintf ppf "%a" pp x)
  | None -> (fun _ _ -> ())

let print_name ?nap () ppf name =
  pp_print_string ppf name.nm_name

let rec get_expr_args a al =
  match a.pexp_desc with
  | Pexp_apply (a1, a2) ->
      get_expr_args a1 (a2 :: al)
  | _ -> (a, al) 

let print_pat, print_expr, print_structure_item = 
  let aux ?eap ?iap ?nap ?pap () =

    let rec print_dots ppf dot =   
      match dot with
        | Dot_pat ps ->
            fprintf ppf "%a" print_pat ps
        | Dot_exp es ->
            fprintf ppf "%a" print_expr es
        | Dot_str ss ->
            fprintf ppf "%a" print_structure_item ss
              
    and print_dots_list ppf  = function
      | [] -> fprintf ppf ".." 
      | dots -> fprintf ppf "@[<h 2>.. %a ..@]" (List.print print_dots " .. ") dots
        
    and print_pat ppf pat =
      match pat.ppat_desc with
        | Ppat_any ->
            pp_print_string ppf "_"
        | Ppat_var { nm_name = v } ->
            pp_print_string ppf v
        | Ppat_constant c ->
            print_constant ppf c
        | Ppat_tuple ps ->
            fprintf ppf "@[<h 2>(%a)@]" (List.print print_pat ", ") ps
        | Ppat_construct ({ lid_name = lid }, opt_pat, _) ->
            let p ppf = function None -> () | Some pat -> print_pat ppf pat in
              fprintf ppf "@[<h 2>%a %a@]" Longident.print lid p opt_pat
        | Ppat_record fs ->
            let print_field ppf ({ lid_name = field }, pat) =
              fprintf ppf "@[<h 2>%a = %a@]" Longident.print field print_pat pat in
              fprintf ppf "@[<h 2>{%a}@]" (List.print print_field "; ") fs
        | Ppat_or (p1, p2) ->
            fprintf ppf "@[<h 2>%a | %a@]" print_pat p1 print_pat p2
        | Ppat_constraint (p, ct) ->
            fprintf ppf "@[<h 2>%a : %a@]" print_pat p print_core_type ct
        | Ppat_alias (p, nm) ->
            fprintf ppf "@[<h 2>%a as %s@]" print_pat p nm.nm_name
        | Ppat_dots ps ->
            fprintf ppf "%a" print_dots_list ps

                
    and print_expr ppf expr =
      let print_expr_desc ppf = function
        | Pexp_ident { lid_name = v } ->
            Longident.print ppf v
        | Pexp_constant c ->
            print_constant ppf c
        | Pexp_let (bindings, body) ->
            let rec collect_funs sofar = function
              | { pexp_desc = Pexp_function ([pat, exp]) } ->
                  collect_funs (pat :: sofar) exp
              | exp -> List.rev sofar, exp in
            let print_binding ppf (pat, expr) =
              let pats, expr = collect_funs [pat] expr in
              fprintf ppf "@[<h 2>%a = %a@]" (List.print print_pat " ") pats print_expr expr in
            fprintf ppf "@[<h 2>let %a in@[<h 2> %a@]@]" (List.print print_binding " and ") bindings print_expr body
        | Pexp_letrec (bindings, body) ->
            let print_binding ppf (var, expr) =
              fprintf ppf "@[<h 2>%s = %a@]" var.nm_name print_expr expr in
              fprintf ppf "@[<h 2>let rec %a in@[<h 2> %a@]@]" (List.print print_binding " and ") bindings print_expr body
        | Pexp_function rules ->
            fprintf ppf "@[<h 2>function %a@]" print_rules rules
        | Pexp_apply ({ pexp_desc = Pexp_apply ({ pexp_desc = Pexp_ident {lid_name = Longident.Lident nm}}, exp1)}, exp2)
            when is_infix nm ->
            fprintf ppf "@[<h 2>%a %s %a@]" print_expr exp1 nm print_expr exp2
        | Pexp_apply (exp1, exp2) ->
            let a, al = get_expr_args exp1 [exp2] in
            fprintf ppf "@[<h 2>%a~%a@]" print_expr a (List.print print_expr "~") al
        | Pexp_match (exp, rules) ->
            fprintf ppf "@[<h 2>match %a with %a@]"
              print_expr exp
              print_rules rules
        | Pexp_try (exp, rules) ->
            fprintf ppf "@[<h 2>try@[<h 2> %a@] with@[<h 2> %a@]@]"
              print_expr exp
              print_rules rules
        | Pexp_tuple exps ->
            fprintf ppf "@[<h 2>(%a)@]"
              (List.print print_expr ", ") exps
        | Pexp_construct ({ lid_name = lid }, opt_exp, _) ->
            begin match lid with
              | Longident.Lident "::" ->
                  let print_proper_list ppf =
                    fprintf ppf "@[<h 2>[%a]@]" (List.print print_expr "; ") in
                  let rec print_list ppf sofar expr =
                    match expr.pexp_desc with
                      | Pexp_construct ({lid_name = Longident.Lident "[]"}, None, _) ->
                          print_proper_list ppf (List.rev sofar)
                      | Pexp_dots _ ->
                          print_proper_list ppf (List.rev (expr :: sofar))
                      | Pexp_construct ({lid_name = Longident.Lident "::"},
                                        Some ({pexp_desc = Pexp_tuple [head; tail]}), _) ->
                          print_list ppf (head :: sofar) tail
                      | _ ->
                          List.print print_expr " :: " ppf (List.rev (expr :: sofar)) in
                  print_list ppf [] expr
              | _ ->
                  let p ppf = function
                    | Some exps ->
                        fprintf ppf " %a"
                          print_expr exps
                    | None -> () in
                  fprintf ppf "@[<h 2>%s%a@]"
                    (String.concat "." (Longident.flatten lid))
                    p opt_exp
            end
        | Pexp_constraint (exp, ty) ->
            fprintf ppf "@[<h 2>(%a : %a)@]" print_expr exp print_core_type ty 
        | Pexp_sequence (exp1, exp2) ->
            fprintf ppf "@[<h 2>%a; %a@]" print_expr exp1 print_expr exp2
        | Pexp_assertfalse ->
            pp_print_string ppf "assert false"
        | Pexp_assert exp ->
            fprintf ppf "@[<h 2>assert %a@]" print_expr exp
        | Pexp_ifthenelse (exp1, exp2, opt_exp3) ->
            let aux ppf = function
              | Some exp3 -> fprintf ppf " else@[<h 2> %a@]" print_expr exp3
              | None -> () in
              fprintf ppf "@[<h 2>if %a then@[<h 2> %a@]%a@]" print_expr exp1 print_expr exp2 aux opt_exp3
        | Pexp_field (exp, fl) ->
            fprintf ppf "@[<h 2>%a.%a@]" print_expr exp Longident.print fl.lid_name
        | Pexp_for (nm, expr1, expr2, dir, expr3) ->
            let string_of_dir_flag = function
              | Upto -> "to"
              | Downto -> "downto" in
            fprintf ppf "@[<h 2>for %s from @[<h 2>%a@] %s @[<h 2>%a@] do@[<h 2> %a done@]@]"
              nm.nm_name
              print_expr expr1
              (string_of_dir_flag dir)
              print_expr expr2
              print_expr expr3
        | Pexp_while (expr1, expr2) ->
            fprintf ppf "@[<h 2>while @[<h 2>%a@] do@[<h 2> %a@] done@]"
              print_expr expr1 print_expr expr2
        | Pexp_setfield (expr1, lid, expr2) ->
            fprintf ppf "@[<h 2>(%a).%a <- %a@]" print_expr expr1 Longident.print lid.lid_name print_expr expr2
        | Pexp_record (fs, head) ->
            let print_head ppf =
              match head with
                | None -> ()
                | Some expr -> fprintf ppf "%a with " print_expr expr in
            let print_fields ppf =
              let aux ppf (lid,expr) = fprintf ppf "@[<h 2>%a = %a;@] " Longident.print lid.lid_name print_expr expr in
              fprintf ppf "@[<h 2>%a@]" (List.print aux ":@] @[<h 2>") fs in
            fprintf ppf "@[<h 2>{%t%t}@]" print_head print_fields
        | Pexp_dots ps ->
           print_dots_list ppf ps
      in
      fprintf ppf "%a%a"
        print_expr_desc expr.pexp_desc
        (print_wrap eap) expr.pexp_data

    and print_rule ppf (pat, exp) =
        fprintf ppf "%a -> %a" print_pat pat print_expr exp

    and print_rules ppf rules =
      fprintf ppf "%a" (List.print print_rule " | ") rules

          
        
    and print_structure_item ppf strit =
      let print_binding p ppf (n, expr) =
        match expr.pexp_desc with
          | Pexp_constraint (expr, ctyp) ->
              fprintf ppf "@[<h 2>%a : %a = %a@]" p n print_core_type ctyp print_expr expr
          | _ ->
              fprintf ppf "@[<h 2>%a = %a@]" p n print_expr expr in
      match strit.pstr_desc with
        | Pstr_eval expr ->
            print_expr ppf expr
        | Pstr_value bindings ->
            fprintf ppf "@[<h 2>let %a@]" (List.print (print_binding print_pat) " and ") bindings
        | Pstr_rec_value bindings ->
            fprintf ppf "@[<h 2>let rec %a@]" (List.print (print_binding (fun ppf nm -> pp_print_string ppf nm.nm_name)) " and ") bindings
        | Pstr_type ds ->
            let p ppf (name, td) =
              fprintf ppf "@[<h 2>%s = %a@]" name.nm_name print_type_declaration td in
              fprintf ppf "@[<h 2>type %a@]" (List.print p " and") ds
        | Pstr_exception (name, tys) ->
            fprintf ppf "@[<h 2>exception %s =@[<h 2>%a@]@]" name.nm_name (List.print print_core_type " * ") tys
        | Pstr_open lid ->
            fprintf ppf "@[<h 2>open %a@]" Longident.print lid.lid_name
        | Pstr_dots dl ->
            print_dots_list ppf dl
    in
      print_pat,print_expr,print_structure_item
  in
    (fun ?eap ?iap ?nap ?pap () -> let (f,_,_) = aux ?eap ?iap ?nap ?pap () in f),
    (fun ?eap ?iap ?nap ?pap () -> let (_,g,_) = aux ?eap ?iap ?nap ?pap () in g),
    (fun ?eap ?iap ?nap ?pap () -> let (_,_,h) = aux ?eap ?iap ?nap ?pap () in h)

let rec print_pat_short ppf pat =
    match pat.ppat_desc with
      | Ppat_any ->
          pp_print_string ppf "_"
      | Ppat_var { nm_name = v } ->
          pp_print_string ppf v
      | Ppat_constant c ->
          print_constant ppf c
      | Ppat_tuple ps ->
          fprintf ppf "@[<h 2>(%a)@]" (List.print print_pat_short ", ") ps
      | Ppat_construct ({ lid_name = lid }, opt_pat, _) ->
          let p ppf = function None -> () | Some pat -> print_pat_short ppf pat in
            fprintf ppf "@[<h 2>%a %a@]" Longident.print lid p opt_pat
      | Ppat_record fs ->
          let print_field ppf ({ lid_name = field }, pat) =
            fprintf ppf "@[<h 2>%a = %a@]" Longident.print field print_pat_short pat in
            fprintf ppf "@[<h 2>{%a}@]" (List.print print_field "; ") fs
      | Ppat_or (p1, p2) ->
          fprintf ppf "@[<h 2>%a | %a@]" print_pat_short p1 print_pat_short p2
      | Ppat_constraint (p, ct) ->
          fprintf ppf "@[<h 2>%a : %a@]" print_pat_short p print_core_type ct
      | Ppat_alias (p, nm) ->
          fprintf ppf "@[<h 2>%a as %s@]" print_pat_short p nm.nm_name
      | Ppat_dots ps -> ()
 
let rec print_rule_short ppf (pat, exp) =
    fprintf ppf "%a -> %a" print_pat_short pat print_expr_short exp

and print_rules_short ppf rules =
  fprintf ppf "%a" (List.print print_rule_short " | ") rules
               
and print_expr_short ppf expr =
    let print_expr_desc ppf = function
      | Pexp_ident { lid_name = v } ->
          Longident.print ppf v
      | Pexp_constant c ->
          print_constant ppf c
      | Pexp_let (bindings, body) ->
          pp_print_string ppf "let . in ." 
      | Pexp_letrec (bindings, body) ->
          pp_print_string ppf "let rec . in ." 
      | Pexp_function rules ->
          fprintf ppf "@[<h 2>function %a@]" print_rules_short rules
      | Pexp_apply ({ pexp_desc = Pexp_apply ({ pexp_desc = Pexp_ident {lid_name = Longident.Lident nm}}, exp1)}, exp2)
          when is_infix nm ->
          fprintf ppf "@[<h 2>%a %s %a@]" print_expr_short exp1 nm print_expr_short exp2
      | Pexp_apply (exp1, exp2) ->
        let a, al = get_expr_args exp1 [exp2] in
          fprintf ppf "@[<h 2>%a %a@]" print_expr_short a (List.print print_expr_short " ") al
      | Pexp_match (exp, rules) ->
          pp_print_string ppf "match . with ." 
      | Pexp_try (exp, rules) ->
          pp_print_string ppf "try . with ." 
      | Pexp_tuple exps ->
          fprintf ppf "@[<h 2>(%a)@]"
            (List.print print_expr_short ", ") exps
      | Pexp_construct ({ lid_name = lid }, opt_exp, _) ->
          begin match lid with
            | Longident.Lident "::" ->
                let print_proper_list ppf =
                  fprintf ppf "@[<h 2>[%a]@]" (List.print print_expr_short "; ") in
                let rec print_list ppf sofar expr =
                  match expr.pexp_desc with
                    | Pexp_construct ({lid_name = Longident.Lident "[]"}, None, _) ->
                        print_proper_list ppf (List.rev sofar)
                    | Pexp_dots _ ->
                        print_proper_list ppf (List.rev (expr :: sofar))
                    | Pexp_construct ({lid_name = Longident.Lident "::"},
                                      Some ({pexp_desc = Pexp_tuple [head; tail]}), _) ->
                        print_list ppf (head :: sofar) tail
                    | _ ->
                        List.print print_expr_short " :: " ppf (List.rev (expr :: sofar)) in
                print_list ppf [] expr
            | _ ->
                let p ppf = function
                  | Some exps ->
                      fprintf ppf " %a"
                        print_expr_short exps
                  | None -> () in
                fprintf ppf "@[<h 2>%s%a@]"
                  (String.concat "." (Longident.flatten lid))
                  p opt_exp
          end
      | Pexp_constraint (exp, ty) ->
          fprintf ppf "@[<h 2>(%a : %a)@]" print_expr_short exp print_core_type ty 
      | Pexp_sequence (exp1, exp2) ->
          fprintf ppf "@[<h 2>%a; %a@]" print_expr_short exp1 print_expr_short exp2
      | Pexp_assertfalse ->
          pp_print_string ppf "assert false"
      | Pexp_assert exp ->
          fprintf ppf "@[<h 2>assert %a@]" print_expr_short exp
      | Pexp_ifthenelse (exp1, exp2, None) ->
          pp_print_string ppf "if . then . "
      | Pexp_ifthenelse (exp1, exp2, Some exp3) ->
          pp_print_string ppf "if . then . else ."
      | Pexp_field (exp, fl) ->
          fprintf ppf "@[<h 2>%a.%a@]" print_expr_short exp Longident.print fl.lid_name
      | Pexp_for (nm, expr1, expr2, dir, expr3) ->
          pp_print_string ppf "for . from . do . done"
      | Pexp_while (expr1, expr2) ->
          pp_print_string ppf "while . do . done"
      | Pexp_setfield (expr1, lid, expr2) ->
          fprintf ppf "@[<h 2>(%a).%a <- %a@]" print_expr_short expr1
          Longident.print lid.lid_name print_expr_short expr2
      | Pexp_record (fs, head) ->
          let print_head ppf =
            match head with
              | None -> ()
              | Some expr -> fprintf ppf "%a with " print_expr_short expr in
          let print_fields ppf =
            let aux ppf (lid,expr) = fprintf ppf "@[<h 2>%a = %a;@] "
            Longident.print lid.lid_name print_expr_short expr in
            fprintf ppf "@[<h 2>%a@]" (List.print aux ":@] @[<h 2>") fs in
          fprintf ppf "@[<h 2>{%t%t}@]" print_head print_fields
      | Pexp_dots ps -> ()
    in
    fprintf ppf "%a"
      print_expr_desc expr.pexp_desc



(** A utility to collect all occurring locations in an AST.
  *)
module CollectLocs = struct
  open LocationSet
  open EzyUtils.Infix

  let on_opt f = function None -> empty | Some x -> f x
  let on_pair f g (x, y) = union (f x) (g y)

  let name nm = singleton nm.nm_loc

  let rec core_type ct =
    add ct.ptyp_loc begin
      match ct.ptyp_desc with
        | Ptyp_any | Ptyp_var _ | Ptyp_object _ | Ptyp_class _ | Ptyp_variant _ -> empty
        | Ptyp_arrow (_, ct1, ct2) ->
            union (core_type ct1) (core_type ct2)
        | Ptyp_tuple cts
        | Ptyp_constr (_, cts) ->
            big_union (List.map core_type cts)
        | Ptyp_alias (ct, _)
        | Ptyp_poly (_, ct) ->
            core_type ct
    end

  let rec pattern pat =
    add pat.ppat_loc begin
      match pat.ppat_desc with
        | Ppat_dots _ | Ppat_any | Ppat_var _ | Ppat_constant _ -> empty
        | Ppat_tuple ps -> big_union (List.map pattern ps)
        | Ppat_construct (_, p, _) -> on_opt pattern p
        | Ppat_record fs -> big_union (List.map (pattern << snd) fs)
        | Ppat_or (p1, p2) -> union (pattern p1) (pattern p2)
        | Ppat_constraint (p, ct) -> union (pattern p) (core_type ct)
        | Ppat_alias (p, _) -> pattern p
    end

  let rec expr e =
    add e.pexp_loc begin
      match e.pexp_desc with
        | Pexp_ident _ 
        | Pexp_constant _ 
        | Pexp_assertfalse 
        | Pexp_dots _ -> empty
        | Pexp_let (bs, body) ->
            union (rules bs) (expr body)
        | Pexp_letrec (rbs, body) ->
            big_union (expr body :: List.map (on_pair name expr) rbs)
        | Pexp_function rs ->
            rules rs
        | Pexp_setfield (e1, _, e2)
        | Pexp_sequence (e1, e2)
        | Pexp_while (e1, e2)
        | Pexp_apply (e1, e2) ->
            union (expr e1) (expr e2)
        | Pexp_try (e, rs)
        | Pexp_match (e, rs) ->
            union (expr e) (rules rs)
        | Pexp_tuple es ->
            big_union (List.map expr es)
        | Pexp_construct (_, e, _) -> on_opt expr e
        | Pexp_record (fs, e) ->
            big_union (on_opt expr e :: List.map (expr << snd) fs)
        | Pexp_assert e
        | Pexp_field (e, _) -> expr e
        | Pexp_ifthenelse (e1, e2, e3) ->
            big_union [expr e1; expr e2; on_opt expr e3]
        | Pexp_for (nm, e1, e2, _, e3) ->
            big_union [name nm; expr e1; expr e2; expr e3]
        | Pexp_constraint (e, ct) ->
            union (expr e) (core_type ct)
    end
  and rules rs = big_union (List.map (on_pair pattern expr) rs)

  let type_decl (nm, td) =
    union (big_union (List.map name (nm :: td.type_params))) begin
      match td.type_kind with
        | Abstract -> empty
        | Synonym ct -> core_type ct
        | Variant vs ->
            big_union (List.map (fun (_,cts,loc) -> add loc (big_union (List.map core_type cts))) vs)
        | Record fs ->
            big_union (List.map (fun (_,_,ct,loc) -> add loc (core_type ct)) fs)
    end

  let strit s = 
    add s.pstr_loc begin
      match s.pstr_desc with
        | Pstr_eval e -> expr e
        | Pstr_value rs -> rules rs
        | Pstr_rec_value rbs -> big_union (List.map (on_pair (fun nm -> singleton nm.nm_loc) expr) rbs)
        | Pstr_type ts -> big_union (List.map type_decl ts)
        | Pstr_exception _ -> empty
        | Pstr_open _ -> empty
        | Pstr_dots _ -> empty
    end

  let structure s = big_union (List.map strit s)
end

module MapAstData = struct
  let rec dot_item map_expr_data map_pattern_data = function
    | Dot_pat p -> Dot_pat (pattern map_expr_data map_pattern_data p)
    | Dot_exp e -> Dot_exp (expression map_expr_data map_pattern_data e)
    | Dot_str s -> Dot_str (structure_item map_expr_data map_pattern_data s)
  and pattern map_expr_data map_pattern_data pat =
    let pat_aux = pattern map_expr_data map_pattern_data in
    let desc' = match pat.ppat_desc with
      | Ppat_any 
      | Ppat_var _
      | Ppat_constant _ as desc -> desc
      | Ppat_tuple pats ->
          Ppat_tuple (List.map pat_aux pats)
      | Ppat_construct (lid, opt_pat, x) ->
          Ppat_construct (lid, Option.map ~f:pat_aux opt_pat, x)
      | Ppat_record fs ->
          Ppat_record (List.map (fun (fld, p) -> fld, pat_aux p) fs)
      | Ppat_or (p1, p2) ->
          Ppat_or (pat_aux p1, pat_aux p2)
      | Ppat_constraint (p, ct) ->
          Ppat_constraint (pat_aux p, ct)
      | Ppat_alias (p, nm) ->
          Ppat_alias (pat_aux p, nm)
      | Ppat_dots its ->
          Ppat_dots (List.map (dot_item map_expr_data map_pattern_data) its) in
    { pat with ppat_desc = desc'; ppat_data = map_pattern_data pat.ppat_data }
  and expression map_expr_data map_pattern_data expr =
    let exp_aux = expression map_expr_data map_pattern_data in
    let pat_aux = pattern map_expr_data map_pattern_data in
    let rls_aux rs = List.map (fun (p, e) -> pat_aux p, exp_aux e) rs in
    let desc' = match expr.pexp_desc with
      | Pexp_ident _ 
      | Pexp_assertfalse 
      | Pexp_constant _ as desc -> desc
      | Pexp_let (bindings, body) ->
          Pexp_let (rls_aux bindings, exp_aux body)
      | Pexp_letrec (bindings, body) ->
          Pexp_letrec (List.map (fun (nm, e) -> nm, exp_aux e) bindings, exp_aux body)
      | Pexp_function rules ->
          Pexp_function (rls_aux rules)
      | Pexp_apply (e1, e2) ->
          Pexp_apply (exp_aux e1, exp_aux e2)
      | Pexp_match (e, rs) ->
          Pexp_match (exp_aux e, rls_aux rs)
      | Pexp_try (e, rs) ->
          Pexp_try (exp_aux e, rls_aux rs)
      | Pexp_tuple es ->
          Pexp_tuple (List.map exp_aux es)
      | Pexp_construct (lid, opt_e, x) ->
          Pexp_construct (lid, Option.map ~f:exp_aux opt_e, x)
      | Pexp_record (flds, opt_e) ->
          Pexp_record (List.map (fun (lid, e) -> lid, exp_aux e) flds, Option.map ~f:exp_aux opt_e)
      | Pexp_field (e, lid) ->
          Pexp_field (exp_aux e, lid)
      | Pexp_setfield (e1, lid, e2) ->
          Pexp_setfield (exp_aux e2, lid, exp_aux e2)
      | Pexp_ifthenelse (e1, e2, opt_e3) ->
          Pexp_ifthenelse (exp_aux e1, exp_aux e2, Option.map ~f:exp_aux opt_e3)
      | Pexp_sequence (e1, e2) ->
          Pexp_sequence (exp_aux e1, exp_aux e2)
      | Pexp_while (e1, e2) ->
          Pexp_while (exp_aux e1, exp_aux e2)
      | Pexp_for (nm, e1, e2, d, e3) ->
          Pexp_for (nm, exp_aux e1, exp_aux e2, d, exp_aux e3)
      | Pexp_assert e ->
          Pexp_assert (exp_aux e)
      | Pexp_constraint (e, ct) ->
          Pexp_constraint (exp_aux e, ct)
      | Pexp_dots its ->
          Pexp_dots (List.map (dot_item map_expr_data map_pattern_data) its) in
    { expr with pexp_desc = desc'; pexp_data = map_expr_data expr.pexp_data }
  and structure_item map_expr_data map_pattern_data str_it =
    let exp_aux = expression map_expr_data map_pattern_data in
    let pat_aux = pattern map_expr_data map_pattern_data in
    let desc' = match str_it.pstr_desc with
      | Pstr_type _
      | Pstr_exception _
      | Pstr_open _ as desc ->
          desc
      | Pstr_eval e ->
          Pstr_eval (exp_aux e)
      | Pstr_value bindings ->
          Pstr_value (List.map (fun (p, e) -> pat_aux p, exp_aux e) bindings)
      | Pstr_rec_value bindings ->
          Pstr_rec_value (List.map (fun (nm, e) -> nm, exp_aux e) bindings)
      | Pstr_dots its ->
          Pstr_dots (List.map (dot_item map_expr_data map_pattern_data) its) in
    { str_it with pstr_desc = desc' }
end
let map_structure_item = MapAstData.structure_item 
