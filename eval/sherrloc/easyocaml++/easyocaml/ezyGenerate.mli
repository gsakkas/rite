open EzyUtils
open EzyOcamlmodules
open EzyTypingCoreTypes
open EzyErrors
open EzyEnrichedAst

module EzyPredef :
  sig
    val bool_type : ExtLocation.t -> Ty.t
    val unit_type : ExtLocation.t -> Ty.t
    val exn_type : ExtLocation.t -> Ty.t
    val int_type : ExtLocation.t -> Ty.t
    val array_type : ExtLocation.t -> Ty.t -> Ty.t
  end

module TypeAnnotation : sig
  type t = {
    general : Ty.t;
    loc : Location.t;
    special : Parsetree.core_type;
  }
  val compare : t -> t -> int
  type printable = t
  val print : Format.formatter -> t -> unit
  val valid : EzyEnv.t -> TyVarSubst.t -> t -> ErrorSet.t
end

(** PostProcess.t contains information which must be checked after the
  * generation (unbound_vars) or after unification (type_annotations) -
  * after generation anyway.
  *)
module PostProcess : sig
  module TypeAnnotations : sig
    include Set.S with type elt = TypeAnnotation.t
    val valid :
      EzyEnv.t -> TyVarSubst.t -> t -> ErrorSet.t
  end
  type t = {
    heavies: HeavyErrorSet.t ;              (** Errors which do not allow unification and raised before that  *)
    errors: ErrorSet.t ;                    (** Errors which are reported after unification *)
    type_annotations: TypeAnnotations.t ;   (** Type annotations are to be checked after unification *)
  }
  val empty : t
  val has_heavies : t -> bool
end

type pattern_binding = (Ty.t * Ident.t * Location.t) StringMap.t
val for_pattern :
  EzyAst.imported_pattern -> EzyEnv.t ->
  generated_pattern * EzyConstraints.AtConstrSet.t * PostProcess.t * pattern_binding

val ty_of_expr :
  EzyEnrichedAst.generated_expression -> EzyTypingCoreTypes.Ty.t

val for_expr : 
  ?binding: string option -> EzyAst.imported_expression -> EzyEnv.t ->
  generated_expression * EzyConstraints.AtConstrSet.t * PostProcess.t

val for_structure :
  EzyAst.imported_structure -> Parsetree.structure -> EzyEnv.t -> Env.t ->
  generated_structure * EzyConstraints.AtConstrSet.t * PostProcess.t * EzyEnv.t
