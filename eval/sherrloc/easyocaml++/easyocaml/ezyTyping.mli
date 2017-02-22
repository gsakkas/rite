open EzyOcamlmodules
open EzyTypingCoreTypes
open EzyErrors
open EzyConstraints
open EzyEnrichedAst

(** The functions [unify], [minimize], [enum] and [solve] are implementations
  * of the algorithms described in Haack & Wells, 2004. *)

(** [unify env cs] trys to unify the constraints [cs]. It returns a type
  * assignment for the type variables on success and otherwise a type error and
  * a pair of a set of locations and a location, which is __nice__ in the sense
  * of Haack & Wells. The environment [env] is used to expand type synonyms. *)
val unify :
  EzyEnv.t -> AtConstrSet.t ->
  ((Ty.t * ExtLocationSet.t) TyVarMap.t, type_error * ExtLocationSet.t * ExtLocation.t) EzyUtils.Result.t

val minimize :
  EzyEnv.t -> AtConstrSet.t -> ExtLocationSet.t -> ExtLocation.t ->
  type_error * ExtLocationSet.t

(** This variable constrols how long EasyOCaml enumerates errors. It can be
  * assigned via the environment variable EASYOCAML_ENUM_TIMEOUT and defaults
  * to 3.0 *)
val timeout : float

val enum :
  EzyEnv.t -> float -> AtConstrSet.t ->
  (type_error * ExtLocationSet.t) list

val solve :
  EzyEnv.t -> float -> AtConstrSet.t -> EzyGenerate.PostProcess.t -> 'a ->
  (TyVarSubst.t * ErrorSet.t, ErrorSet.t) EzyUtils.Result.t

(** The following functions apply EzyEnrichedAst.eq_structure to the typed AST
  * to check consistency of EasyOCaml's type checker with OCaml's original one. *)
val type_and_compare_implementation :
  string -> string -> string -> Env.t -> Parsetree.structure -> EzyFeatures.program_feats ->
  (* EzyEnrichedAst.typed_structure * (Typedtree.structure *
   * Typedtree.module_coercion) *)
  (Typedtree.structure * Typedtree.module_coercion)

val type_and_compare_top_phrase :
  EzyFeatures.program_feats -> Env.t ->
  Parsetree.structure -> (* EzyEnrichedAst.typed_structure * *) (Typedtree.structure * Types.signature * Env.t)
