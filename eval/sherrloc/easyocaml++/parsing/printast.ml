(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*             Damien Doligez, projet Para, INRIA Rocquencourt         *)
(*                                                                     *)
(*  Copyright 1999 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: printast.ml,v 1.30.8.1 2007/04/25 19:59:29 doligez Exp $ *)

open Asttypes;;
open Format;;
open Lexing;;
open Location;;
open Parsetree;;

let fmt_position f l =
  if l.pos_fname = "" && l.pos_lnum = 1
  then fprintf f "%d" l.pos_cnum
  else if l.pos_lnum = -1
  then fprintf f "%s[%d]" l.pos_fname l.pos_cnum
  else fprintf f "%s[%d,%d+%d]" l.pos_fname l.pos_lnum l.pos_bol
               (l.pos_cnum - l.pos_bol)
;;

let fmt_location f loc =
  fprintf f "(%a..%a)" fmt_position loc.loc_start fmt_position loc.loc_end;
  if loc.loc_ghost then fprintf f " ghost";
;;

let rec fmt_longident_aux f x =
  match x with
  | Longident.Lident (s) -> fprintf f "%s" s;
  | Longident.Ldot (y, s) -> fprintf f "%a.%s" fmt_longident_aux y s;
  | Longident.Lapply (y, z) ->
      fprintf f "%a(%a)" fmt_longident_aux y fmt_longident_aux z;
;;

let fmt_longident f x = fprintf f "\"%a\"" fmt_longident_aux x;;

let fmt_constant f x =
  match x with
  | Const_int (i) -> fprintf f "Const_int %d" i;
  | Const_char (c) -> fprintf f "Const_char %02x" (Char.code c);
  | Const_string (s) -> fprintf f "Const_string %S" s;
  | Const_float (s) -> fprintf f "Const_float %s" s;
  | Const_int32 (i) -> fprintf f "Const_int32 %ld" i;
  | Const_int64 (i) -> fprintf f "Const_int64 %Ld" i;
  | Const_nativeint (i) -> fprintf f "Const_nativeint %nd" i;
;;

let fmt_mutable_flag f x =
  match x with
  | Immutable -> fprintf f "Immutable";
  | Mutable -> fprintf f "Mutable";
;;

let fmt_virtual_flag f x =
  match x with
  | Virtual -> fprintf f "Virtual";
  | Concrete -> fprintf f "Concrete";
;;

let fmt_rec_flag f x =
  match x with
  | Nonrecursive -> fprintf f "Nonrec";
  | Recursive -> fprintf f "Rec";
  | Default -> fprintf f "Default";
;;

let fmt_direction_flag f x =
  match x with
  | Upto -> fprintf f "Up";
  | Downto -> fprintf f "Down";
;;

let fmt_private_flag f x =
  match x with
  | Public -> fprintf f "Public";
  | Private -> fprintf f "Private";
;;

let line i f s (*...*) =
  fprintf f "%s" (String.make (2*i) ' ');
  fprintf f s (*...*)
;;

let list i f ppf l =
  match l with
  | [] -> line i ppf "[]\n";
  | h::t ->
     line i ppf "[\n";
     List.iter (f (i+1) ppf) l;
     line i ppf "]\n";
;;

let option i f ppf x =
  match x with
  | None -> line i ppf "None\n";
  | Some x ->
      line i ppf "Some\n";
      f (i+1) ppf x;
;;

let longident i ppf li = line i ppf "%a\n" fmt_longident li;;
let string i ppf s = line i ppf "\"%s\"\n" s;;
let bool i ppf x = line i ppf "%s\n" (string_of_bool x);;
let label i ppf x = line i ppf "label=\"%s\"\n" x;;

let rec core_type i ppf x =
  line i ppf "core_type %a\n" fmt_location x.ptyp_loc;
  let i = i+1 in
  match x.ptyp_desc with
  | Ptyp_any -> line i ppf "Ptyp_any\n";
  | Ptyp_var (s) -> line i ppf "Ptyp_var %s\n" s;
  | Ptyp_arrow (l, ct1, ct2) ->
      line i ppf "Ptyp_arrow\n";
      string i ppf l;
      core_type i ppf ct1;
      core_type i ppf ct2;
  | Ptyp_tuple l ->
      line i ppf "Ptyp_tuple\n";
      list i core_type ppf l;
  | Ptyp_constr (li, l) ->
      line i ppf "Ptyp_constr %a\n" fmt_longident li;
      list i core_type ppf l;
  | Ptyp_variant (l, closed, low) ->
      line i ppf "Ptyp_variant closed=%s\n" (string_of_bool closed);
      list i label_x_bool_x_core_type_list ppf l;
      option i (fun i -> list i string) ppf low
  | Ptyp_object (l) ->
      line i ppf "Ptyp_object\n";
      list i core_field_type ppf l;
  | Ptyp_class (li, l, low) ->
      line i ppf "Ptyp_class %a\n" fmt_longident li;
      list i core_type ppf l;
      list i string ppf low
  | Ptyp_alias (ct, s) ->
      line i ppf "Ptyp_alias \"%s\"\n" s;
      core_type i ppf ct;
  | Ptyp_poly (sl, ct) ->
      line i ppf "Ptyp_poly%a\n"
        (fun ppf -> List.iter (fun x -> fprintf ppf " '%s" x)) sl;
      core_type i ppf ct;

and core_field_type i ppf x =
  line i ppf "core_field_type %a\n" fmt_location x.pfield_loc;
  let i = i+1 in
  match x.pfield_desc with
  | Pfield (s, ct) ->
      line i ppf "Pfield \"%s\"\n" s;
      core_type i ppf ct;
  | Pfield_var -> line i ppf "Pfield_var\n";

and pattern i ppf x =
  line i ppf "pattern %a\n" fmt_location x.ppat_loc;
  let i = i+1 in
  match x.ppat_desc with
  | Ppat_any -> line i ppf "Ppat_any\n";
  | Ppat_var (s) -> line i ppf "Ppat_var \"%s\"\n" s;
  | Ppat_alias (p, s) ->
      line i ppf "Ppat_alias \"%s\"\n" s;
      pattern i ppf p;
  | Ppat_constant (c) -> line i ppf "Ppat_constant %a\n" fmt_constant c;
  | Ppat_tuple (l) ->
      line i ppf "Ppat_tuple\n";
      list i pattern ppf l;
  | Ppat_construct (li, po, b) ->
      line i ppf "Ppat_construct %a\n" fmt_longident li;
      option i pattern ppf po;
      bool i ppf b;
  | Ppat_variant (l, po) ->
      line i ppf "Ppat_variant \"%s\"\n" l;
      option i pattern ppf po;
  | Ppat_record (l) ->
      line i ppf "Ppat_record\n";
      list i longident_x_pattern ppf l;
  | Ppat_array (l) ->
      line i ppf "Ppat_array\n";
      list i pattern ppf l;
  | Ppat_or (p1, p2) ->
      line i ppf "Ppat_or\n";
      pattern i ppf p1;
      pattern i ppf p2;
  | Ppat_constraint (p, ct) ->
      line i ppf "Ppat_constraint";
      pattern i ppf p;
      core_type i ppf ct;
  | Ppat_type li ->
      line i ppf "PPat_type";
      longident i ppf li

and expression i ppf x =
  line i ppf "expression %a\n" fmt_location x.pexp_loc;
  let i = i+1 in
  match x.pexp_desc with
  | Pexp_ident (li) -> line i ppf "Pexp_ident %a\n" fmt_longident li;
  | Pexp_constant (c) -> line i ppf "Pexp_constant %a\n" fmt_constant c;
  | Pexp_let (rf, l, e) ->
      line i ppf "Pexp_let %a\n" fmt_rec_flag rf;
      list i pattern_x_expression_def ppf l;
      expression i ppf e;
  | Pexp_function (p, eo, l) ->
      line i ppf "Pexp_function \"%s\"\n" p;
      option i expression ppf eo;
      list i pattern_x_expression_case ppf l;
  | Pexp_apply (e, l) ->
      line i ppf "Pexp_apply\n";
      expression i ppf e;
      list i label_x_expression ppf l;
  | Pexp_match (e, l) ->
      line i ppf "Pexp_match\n";
      expression i ppf e;
      list i pattern_x_expression_case ppf l;
  | Pexp_try (e, l) ->
      line i ppf "Pexp_try\n";
      expression i ppf e;
      list i pattern_x_expression_case ppf l;
  | Pexp_tuple (l) ->
      line i ppf "Pexp_tuple\n";
      list i expression ppf l;
  | Pexp_construct (li, eo, b) ->
      line i ppf "Pexp_construct %a\n" fmt_longident li;
      option i expression ppf eo;
      bool i ppf b;
  | Pexp_variant (l, eo) ->
      line i ppf "Pexp_variant \"%s\"\n" l;
      option i expression ppf eo;
  | Pexp_record (l, eo) ->
      line i ppf "Pexp_record\n";
      list i longident_x_expression ppf l;
      option i expression ppf eo;
  | Pexp_field (e, li) ->
      line i ppf "Pexp_field\n";
      expression i ppf e;
      longident i ppf li;
  | Pexp_setfield (e1, li, e2) ->
      line i ppf "Pexp_setfield\n";
      expression i ppf e1;
      longident i ppf li;
      expression i ppf e2;
  | Pexp_array (l) ->
      line i ppf "Pexp_array\n";
      list i expression ppf l;
  | Pexp_ifthenelse (e1, e2, eo) ->
      line i ppf "Pexp_ifthenelse\n";
      expression i ppf e1;
      expression i ppf e2;
      option i expression ppf eo;
  | Pexp_sequence (e1, e2) ->
      line i ppf "Pexp_sequence\n";
      expression i ppf e1;
      expression i ppf e2;
  | Pexp_while (e1, e2) ->
      line i ppf "Pexp_while\n";
      expression i ppf e1;
      expression i ppf e2;
  | Pexp_for (s, e1, e2, df, e3) ->
      line i ppf "Pexp_for \"%s\" %a\n" s fmt_direction_flag df;
      expression i ppf e1;
      expression i ppf e2;
      expression i ppf e3;
  | Pexp_constraint (e, cto1, cto2) ->
      line i ppf "Pexp_constraint\n";
      expression i ppf e;
      option i core_type ppf cto1;
      option i core_type ppf cto2;
  | Pexp_when (e1, e2) ->
      line i ppf "Pexp_when\n";
      expression i ppf e1;
      expression i ppf e2;
  | Pexp_send (e, s) ->
      line i ppf "Pexp_send \"%s\"\n" s;
      expression i ppf e;
  | Pexp_new (li) -> line i ppf "Pexp_new %a\n" fmt_longident li;
  | Pexp_setinstvar (s, e) ->
      line i ppf "Pexp_setinstvar \"%s\"\n" s;
      expression i ppf e;
  | Pexp_override (l) ->
      line i ppf "Pexp_override\n";
      list i string_x_expression ppf l;
  | Pexp_letmodule (s, me, e) ->
      line i ppf "Pexp_letmodule \"%s\"\n" s;
      module_expr i ppf me;
      expression i ppf e;
  | Pexp_assert (e) ->
      line i ppf "Pexp_assert";
      expression i ppf e;
  | Pexp_assertfalse ->
      line i ppf "Pexp_assertfalse";
  | Pexp_lazy (e) ->
      line i ppf "Pexp_lazy";
      expression i ppf e;
  | Pexp_poly (e, cto) ->
      line i ppf "Pexp_poly\n";
      expression i ppf e;
      option i core_type ppf cto;
  | Pexp_object s ->
      line i ppf "Pexp_object";
      class_structure i ppf s

and value_description i ppf x =
  line i ppf "value_description\n";
  core_type (i+1) ppf x.pval_type;
  list (i+1) string ppf x.pval_prim;

and type_declaration i ppf x =
  line i ppf "type_declaration %a\n" fmt_location x.ptype_loc;
  let i = i+1 in
  line i ppf "ptype_params =\n";
  list (i+1) string ppf x.ptype_params;
  line i ppf "ptype_cstrs =\n";
  list (i+1) core_type_x_core_type_x_location ppf x.ptype_cstrs;
  line i ppf "ptype_kind =\n";
  type_kind (i+1) ppf x.ptype_kind;
  line i ppf "ptype_manifest =\n";
  option (i+1) core_type ppf x.ptype_manifest;

and type_kind i ppf x =
  match x with
  | Ptype_abstract ->
      line i ppf "Ptype_abstract\n"
  | Ptype_variant (l, priv) ->
      line i ppf "Ptype_variant %a\n" fmt_private_flag priv;
      list (i+1) string_x_core_type_list_x_location ppf l;
  | Ptype_record (l, priv) ->
      line i ppf "Ptype_record %a\n" fmt_private_flag priv;
      list (i+1) string_x_mutable_flag_x_core_type_x_location ppf l;
  | Ptype_private ->
      line i ppf "Ptype_private\n"

and exception_declaration i ppf x = list i core_type ppf x

and class_type i ppf x =
  line i ppf "class_type %a\n" fmt_location x.pcty_loc;
  let i = i+1 in
  match x.pcty_desc with
  | Pcty_constr (li, l) ->
      line i ppf "Pcty_constr %a\n" fmt_longident li;
      list i core_type ppf l;
  | Pcty_signature (cs) ->
      line i ppf "Pcty_signature\n";
      class_signature i ppf cs;
  | Pcty_fun (l, co, cl) ->
      line i ppf "Pcty_fun \"%s\"\n" l;
      core_type i ppf co;
      class_type i ppf cl;

and class_signature i ppf (ct, l) =
  line i ppf "class_signature\n";
  core_type (i+1) ppf ct;
  list (i+1) class_type_field ppf l;

and class_type_field i ppf x =
  match x with
  | Pctf_inher (ct) ->
      line i ppf "Pctf_inher\n";
      class_type i ppf ct;
  | Pctf_val (s, mf, vf, ct, loc) ->
      line i ppf
        "Pctf_val \"%s\" %a %a %a\n" s
        fmt_mutable_flag mf fmt_virtual_flag vf fmt_location loc;
      core_type (i+1) ppf ct;
  | Pctf_virt (s, pf, ct, loc) ->
      line i ppf
        "Pctf_virt \"%s\" %a %a\n" s fmt_private_flag pf fmt_location loc;
      core_type (i+1) ppf ct;
  | Pctf_meth (s, pf, ct, loc) ->
      line i ppf
        "Pctf_meth \"%s\" %a %a\n" s fmt_private_flag pf fmt_location loc;
      core_type (i+1) ppf ct;
  | Pctf_cstr (ct1, ct2, loc) ->
      line i ppf "Pctf_cstr %a\n" fmt_location loc;
      core_type i ppf ct1;
      core_type i ppf ct2;

and class_description i ppf x =
  line i ppf "class_description %a\n" fmt_location x.pci_loc;
  let i = i+1 in
  line i ppf "pci_virt = %a\n" fmt_virtual_flag x.pci_virt;
  line i ppf "pci_params =\n";
  string_list_x_location (i+1) ppf x.pci_params;
  line i ppf "pci_name = \"%s\"\n" x.pci_name;
  line i ppf "pci_expr =\n";
  class_type (i+1) ppf x.pci_expr;

and class_type_declaration i ppf x =
  line i ppf "class_type_declaration %a\n" fmt_location x.pci_loc;
  let i = i+1 in
  line i ppf "pci_virt = %a\n" fmt_virtual_flag x.pci_virt;
  line i ppf "pci_params =\n";
  string_list_x_location (i+1) ppf x.pci_params;
  line i ppf "pci_name = \"%s\"\n" x.pci_name;
  line i ppf "pci_expr =\n";
  class_type (i+1) ppf x.pci_expr;

and class_expr i ppf x =
  line i ppf "class_expr %a\n" fmt_location x.pcl_loc;
  let i = i+1 in
  match x.pcl_desc with
  | Pcl_constr (li, l) ->
      line i ppf "Pcl_constr %a\n" fmt_longident li;
      list i core_type ppf l;
  | Pcl_structure (cs) ->
      line i ppf "Pcl_structure\n";
      class_structure i ppf cs;
  | Pcl_fun (l, eo, p, e) ->
      line i ppf "Pcl_fun\n";
      label i ppf l;
      option i expression ppf eo;
      pattern i ppf p;
      class_expr i ppf e;
  | Pcl_apply (ce, l) ->
      line i ppf "Pcl_apply\n";
      class_expr i ppf ce;
      list i label_x_expression ppf l;
  | Pcl_let (rf, l, ce) ->
      line i ppf "Pcl_let %a\n" fmt_rec_flag rf;
      list i pattern_x_expression_def ppf l;
      class_expr i ppf ce;
  | Pcl_constraint (ce, ct) ->
      line i ppf "Pcl_constraint\n";
      class_expr i ppf ce;
      class_type i ppf ct;

and class_structure i ppf (p, l) =
  line i ppf "class_structure\n";
  pattern (i+1) ppf p;
  list (i+1) class_field ppf l;

and class_field i ppf x =
  match x with
  | Pcf_inher (ce, so) ->
      line i ppf "Pcf_inher\n";
      class_expr (i+1) ppf ce;
      option (i+1) string ppf so;
  | Pcf_valvirt (s, mf, ct, loc) ->
      line i ppf
        "Pcf_valvirt \"%s\" %a %a\n" s fmt_mutable_flag mf fmt_location loc;
      core_type (i+1) ppf ct;
  | Pcf_val (s, mf, e, loc) ->
      line i ppf
        "Pcf_val \"%s\" %a %a\n" s fmt_mutable_flag mf fmt_location loc;
      expression (i+1) ppf e;
  | Pcf_virt (s, pf, ct, loc) ->
      line i ppf
        "Pcf_virt \"%s\" %a %a\n" s fmt_private_flag pf fmt_location loc;
      core_type (i+1) ppf ct;
  | Pcf_meth (s, pf, e, loc) ->
      line i ppf
        "Pcf_meth \"%s\" %a %a\n" s fmt_private_flag pf fmt_location loc;
      expression (i+1) ppf e;
  | Pcf_cstr (ct1, ct2, loc) ->
      line i ppf "Pcf_cstr %a\n" fmt_location loc;
      core_type (i+1) ppf ct1;
      core_type (i+1) ppf ct2;
  | Pcf_let (rf, l, loc) ->
      line i ppf "Pcf_let %a %a\n" fmt_rec_flag rf fmt_location loc;
      list (i+1) pattern_x_expression_def ppf l;
  | Pcf_init (e) ->
      line i ppf "Pcf_init\n";
      expression (i+1) ppf e;

and class_declaration i ppf x =
  line i ppf "class_declaration %a\n" fmt_location x.pci_loc;
  let i = i+1 in
  line i ppf "pci_virt = %a\n" fmt_virtual_flag x.pci_virt;
  line i ppf "pci_params =\n";
  string_list_x_location (i+1) ppf x.pci_params;
  line i ppf "pci_name = \"%s\"\n" x.pci_name;
  line i ppf "pci_expr =\n";
  class_expr (i+1) ppf x.pci_expr;

and module_type i ppf x =
  line i ppf "module_type %a\n" fmt_location x.pmty_loc;
  let i = i+1 in
  match x.pmty_desc with
  | Pmty_ident (li) -> line i ppf "Pmty_ident %a\n" fmt_longident li;
  | Pmty_signature (s) ->
      line i ppf "Pmty_signature\n";
      signature i ppf s;
  | Pmty_functor (s, mt1, mt2) ->
      line i ppf "Pmty_functor \"%s\"\n" s;
      module_type i ppf mt1;
      module_type i ppf mt2;
  | Pmty_with (mt, l) ->
      line i ppf "Pmty_with\n";
      module_type i ppf mt;
      list i longident_x_with_constraint ppf l;

and signature i ppf x = list i signature_item ppf x

and signature_item i ppf x =
  line i ppf "signature_item %a\n" fmt_location x.psig_loc;
  let i = i+1 in
  match x.psig_desc with
  | Psig_value (s, vd) ->
      line i ppf "Psig_value \"%s\"\n" s;
      value_description i ppf vd;
  | Psig_type (l) ->
      line i ppf "Psig_type\n";
      list i string_x_type_declaration ppf l;
  | Psig_exception (s, ed) ->
      line i ppf "Psig_exception \"%s\"\n" s;
      exception_declaration i ppf ed;
  | Psig_module (s, mt) ->
      line i ppf "Psig_module \"%s\"\n" s;
      module_type i ppf mt;
  | Psig_recmodule decls ->
      line i ppf "Psig_recmodule\n";
      list i string_x_module_type ppf decls;
  | Psig_modtype (s, md) ->
      line i ppf "Psig_modtype \"%s\"\n" s;
      modtype_declaration i ppf md;
  | Psig_open (li) -> line i ppf "Psig_open %a\n" fmt_longident li;
  | Psig_include (mt) ->
      line i ppf "Psig_include\n";
      module_type i ppf mt;
  | Psig_class (l) ->
      line i ppf "Psig_class\n";
      list i class_description ppf l;
  | Psig_class_type (l) ->
      line i ppf "Psig_class_type\n";
      list i class_type_declaration ppf l;

and modtype_declaration i ppf x =
  match x with
  | Pmodtype_abstract -> line i ppf "Pmodtype_abstract\n";
  | Pmodtype_manifest (mt) ->
      line i ppf "Pmodtype_manifest\n";
      module_type (i+1) ppf mt;

and with_constraint i ppf x =
  match x with
  | Pwith_type (td) ->
      line i ppf "Pwith_type\n";
      type_declaration (i+1) ppf td;
  | Pwith_module (li) -> line i ppf "Pwith_module %a\n" fmt_longident li;

and module_expr i ppf x =
  line i ppf "module_expr %a\n" fmt_location x.pmod_loc;
  let i = i+1 in
  match x.pmod_desc with
  | Pmod_ident (li) -> line i ppf "Pmod_ident %a\n" fmt_longident li;
  | Pmod_structure (s) ->
      line i ppf "Pmod_structure\n";
      structure i ppf s;
  | Pmod_functor (s, mt, me) ->
      line i ppf "Pmod_functor \"%s\"\n" s;
      module_type i ppf mt;
      module_expr i ppf me;
  | Pmod_apply (me1, me2) ->
      line i ppf "Pmod_apply\n";
      module_expr i ppf me1;
      module_expr i ppf me2;
  | Pmod_constraint (me, mt) ->
      line i ppf "Pmod_constraint\n";
      module_expr i ppf me;
      module_type i ppf mt;

and structure i ppf x = list i structure_item ppf x

and structure_item i ppf x =
  line i ppf "structure_item %a\n" fmt_location x.pstr_loc;
  let i = i+1 in
  match x.pstr_desc with
  | Pstr_eval (e) ->
      line i ppf "Pstr_eval\n";
      expression i ppf e;
  | Pstr_value (rf, l) ->
      line i ppf "Pstr_value %a\n" fmt_rec_flag rf;
      list i pattern_x_expression_def ppf l;
  | Pstr_primitive (s, vd) ->
      line i ppf "Pstr_primitive \"%s\"\n" s;
      value_description i ppf vd;
  | Pstr_type (l) ->
      line i ppf "Pstr_type\n";
      list i string_x_type_declaration ppf l;
  | Pstr_exception (s, ed) ->
      line i ppf "Pstr_exception \"%s\"\n" s;
      exception_declaration i ppf ed;
  | Pstr_exn_rebind (s, li) ->
      line i ppf "Pstr_exn_rebind \"%s\" %a\n" s fmt_longident li;
  | Pstr_module (s, me) ->
      line i ppf "Pstr_module \"%s\"\n" s;
      module_expr i ppf me;
  | Pstr_recmodule bindings ->
      line i ppf "Pstr_recmodule\n";
      list i string_x_modtype_x_module ppf bindings;
  | Pstr_modtype (s, mt) ->
      line i ppf "Pstr_modtype \"%s\"\n" s;
      module_type i ppf mt;
  | Pstr_open (li) -> line i ppf "Pstr_open %a\n" fmt_longident li;
  | Pstr_class (l) ->
      line i ppf "Pstr_class\n";
      list i class_declaration ppf l;
  | Pstr_class_type (l) ->
      line i ppf "Pstr_class_type\n";
      list i class_type_declaration ppf l;
  | Pstr_include me ->
      line i ppf "Pstr_include";
      module_expr i ppf me

and string_x_type_declaration i ppf (s, td) =
  string i ppf s;
  type_declaration (i+1) ppf td;

and string_x_module_type i ppf (s, mty) =
  string i ppf s;
  module_type (i+1) ppf mty;

and string_x_modtype_x_module i ppf (s, mty, modl) =
  string i ppf s;
  module_type (i+1) ppf mty;
  module_expr (i+1) ppf modl;

and longident_x_with_constraint i ppf (li, wc) =
  line i ppf "%a\n" fmt_longident li;
  with_constraint (i+1) ppf wc;

and core_type_x_core_type_x_location i ppf (ct1, ct2, l) =
  line i ppf "<constraint> %a\n" fmt_location l;
  core_type (i+1) ppf ct1;
  core_type (i+1) ppf ct2;

and string_x_core_type_list_x_location i ppf (s, l, loc) =
  line i ppf "\"%s\" %a\n" s fmt_location loc;
  list (i+1) core_type ppf l;

and string_x_mutable_flag_x_core_type_x_location i ppf (s, mf, ct, loc) =
  line i ppf "\"%s\" %a %a\n" s fmt_mutable_flag mf fmt_location loc;
  core_type (i+1) ppf ct;

and string_list_x_location i ppf (l, loc) =
  line i ppf "<params> %a\n" fmt_location loc;
  list (i+1) string ppf l;

and longident_x_pattern i ppf (li, p) =
  line i ppf "%a\n" fmt_longident li;
  pattern (i+1) ppf p;

and pattern_x_expression_case i ppf (p, e) =
  line i ppf "<case>\n";
  pattern (i+1) ppf  p;
  expression (i+1) ppf e;

and pattern_x_expression_def i ppf (p, e) =
  line i ppf "<def>\n";
  pattern (i+1) ppf p;
  expression (i+1) ppf e;

and string_x_expression i ppf (s, e) =
  line i ppf "<override> \"%s\"\n" s;
  expression (i+1) ppf e;

and longident_x_expression i ppf (li, e) =
  line i ppf "%a\n" fmt_longident li;
  expression (i+1) ppf e;

and label_x_expression i ppf (l,e) =
  line i ppf "<label> \"%s\"\n" l;
  expression (i+1) ppf e;

and label_x_bool_x_core_type_list i ppf x =
  match x with
    Rtag (l, b, ctl) ->
      line i ppf "Rtag \"%s\" %s\n" l (string_of_bool b);
      list (i+1) core_type ppf ctl
  | Rinherit (ct) ->
      line i ppf "Rinherit\n";
      core_type (i+1) ppf ct
;;

let rec toplevel_phrase i ppf x =
  match x with
  | Ptop_def (s) ->
      line i ppf "Ptop_def\n";
      structure (i+1) ppf s;
  | Ptop_dir (s, da) ->
      line i ppf "Ptop_dir \"%s\"\n" s;
      directive_argument i ppf da;

and directive_argument i ppf x =
  match x with
  | Pdir_none -> line i ppf "Pdir_none\n"
  | Pdir_string (s) -> line i ppf "Pdir_string \"%s\"\n" s;
  | Pdir_int (i) -> line i ppf "Pdir_int %d\n" i;
  | Pdir_ident (li) -> line i ppf "Pdir_ident %a\n" fmt_longident li;
  | Pdir_bool (b) -> line i ppf "Pdir_bool %s\n" (string_of_bool b);
;;

let interface ppf x = list 0 signature_item ppf x;;

let implementation ppf x = list 0 structure_item ppf x;;

let top_phrase ppf x = toplevel_phrase 0 ppf x;;
