open EzyUtils
open EzyOcamlmodules
open EzyTypingCoreTypes

(** {3 Types for the AST after constraint generation}
  * It then contains type variables and an environment on each node and unique
  * identifiers. *)

type exp_data = { ea_ty : Ty.t; ea_env : EzyEnv.t; }

type id_data = Path.t

type pat_data = {
  pa_ty : Ty.t;
  pa_ident : Ident.t;
  pa_env : EzyEnv.t;
}

type name_data = Ident.t

type generated_expression = (exp_data, id_data, name_data, pat_data) EzyAst.expression
type generated_structure_item = (exp_data, id_data, name_data, pat_data) EzyAst.structure_item
type generated_structure = (exp_data, id_data, name_data, pat_data) EzyAst.structure
type generated_pattern = (exp_data, id_data, name_data, pat_data) EzyAst.pattern
type generated_rule = (exp_data, id_data, name_data, pat_data) EzyAst.rule
type typed_structure = (Ty.t, Path.t, Ident.t, Ty.t) EzyAst.structure

(** {3 Import AST from Parsetree} *)

exception Invalid_type_constructor of (Longident.t * int * int)
exception Unbound_type_constructor of Longident.t

val import_core_type :
  bool -> (Longident.t -> Path.t * 'a list) ->
  TyVar.t StringMap.t -> Parsetree.core_type ->
  TyVar.t StringMap.t * Ty.t

val import_core_types :
  bool -> (Longident.t -> Path.t * 'a list) ->
  TyVar.t StringMap.t -> Parsetree.core_type list ->
  TyVar.t StringMap.t * Ty.t list

val import_expression :
  EzyOcamlmodules.Location.t ->
  EzyFeatures.expr_feats -> Parsetree.expression -> EzyAst.imported_expression

val import_strit :
  EzyFeatures.program_feats ->
  Parsetree.structure_item -> EzyAst.imported_structure_item

val import_structure :
  EzyFeatures.program_feats -> Parsetree.structure_item list ->
  EzyAst.imported_structure_item list

(** {3 Compare EasyOCaml's typed AST with Typedtree} *)

val eq_structure : TyVarSubst.t -> generated_structure_item list -> Typedtree.structure_item list -> string option
val apply_substitution: TyVarSubst.t -> generated_structure_item list -> (Ty.t, Path.t, Ident.t, Ty.t) EzyAst.structure
