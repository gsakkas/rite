
(** This modules gives access to easyocaml's errors and their reporting.
  * 
  * In this module, there are three kinds of errors declared:
  *   [Fatal errors] occurr only singular, because they prohibit any further
  *       processing. 
  *   [Heavy errors] can be generated while EzyGenerate.for_(expr|strit) runs. They
  *       are reported between constraint generation and unification, if any.
  *   [(Common) errors] are generated while constraint generation, unification and
  *       error enumeration. They are reported after error enumeration.
  *  
  * All errors have optional access to the program code (as an [string lazy_t option])
  * and heavy and common errors are annotated with the program code as well as the
  * imported AST (as EzyAst.structure).
  *
  * One can define a new error reporter by writing a module which calls
  * EzyErrors.set_printer with appropriate error reporting functions. This is than
  * dynamically linked into the easyocaml compiler/toploop with the -easyerrorprinter
  * flag. The appropriate function is called on fatal, heavy and common errors.
  *
  * It is recommended for custom error reporting plugins to use
  * EzyErrors.print_error_desc, print_heavy_error_desc, print_fatal_error_desc to
  * have uniform descriptions.
  *)

open EzyUtils

type lang = [ `En | `Fr | `De ]
val lang : lang

type type_error =
  | ConstructorClash of EzyTypingCoreTypes.Ty.t * EzyTypingCoreTypes.Ty.t
  | ArityClash of EzyTypingCoreTypes.Ty.t * EzyTypingCoreTypes.Ty.t * 
      int * int
  | CircularType of EzyTypingCoreTypes.Ty.t * EzyTypingCoreTypes.Ty.t


(** Normal errors are collected while constraint generation and constraint unification.
  *)
type error =
  | Type_error of type_error * EzyOcamlmodules.ExtLocationSet.t
    (** A type error. The location of the error in the error set is none. *)
  | Unbound_variable of EzyOcamlmodules.Longident.t
    (** Usage of an unbound variable. *)
  | Mutable_content of EzyOcamlmodules.Longident.t
    (** For [x.f <- y] where f is not mutable. *)
  | Missing_fields of EzyOcamlmodules.Longident.t * string list
    (** Missing field in record definition. *)
  | Unknown_field of Longident.t
    (** Unknown field in record definition or reading/writing an unknown field. *)
  | No_subtype of EzyTypingCoreTypes.Ty.t * Parsetree.core_type
    (** Invalid type annotation (e.g. [(e : t)] where [t] is not a subtype of the type of expression [e]) *)


(** Information abount invalid record definitions. *)
type record_heavy =
  | Alien_fields of EzyOcamlmodules.Path.t *
      (EzyOcamlmodules.Longident.t * EzyOcamlmodules.Path.t) list
    (** [Alien_fields (p, fs)]: In the record construction of record type [p], the fields
      * in the association list [fs] are from record types given by the values of the assoc list.
      * The actual type of a record construction is given by the type of the _first_ field. *)
  | Unknown_fields of EzyOcamlmodules.Longident.t list
    (** [Unknown_fields fs]: The fields [fs] are unkown in a record construction. *)
  | Fields_bound_several_times of EzyOcamlmodules.Longident.t list
    (** [Fields_bound_several_times fs]: The fields [fs] are bound several times in a record construction. *)
  | No_fields
    (** An empty record definition (syntactically impossible). *)


(** Heavy errors are collected while constraint generation and yield to the termination
  * of compilation before unification. Normal errors are reported along.
  *)
type heavy_error =
  | Several_bindings of string list
    (** [Several_bindings vs]: [vs] is a list of variables which occur several times in one pattern *)
  | Different_bindings of string list * string list
    (** [Different_bindings (vs1, vs2)]: In an or pattern (p1 | p2), variables [vs1] only occur in [p1],
      * and [vs2] occur only in [p2].  *)
  | Invalid_record of record_heavy list
    (** An invalid record definition with a not empty list of [record_heavy] errors. *)
  | Unknown_variant of EzyOcamlmodules.Longident.t
    (** Occurence of an unknown variant constructor. *)
  | Type_variables_not_generalized of string * EzyTypingCoreTypes.Ty.t
    (** [Type_variables_not_generalized [v, ty]: The top level variable [v] has inferred type [ty]
      * which contains a free monomorphic type variable. *)
  | Type_names_not_unique of string list
    (** [Type_names_not_unique ts]: types with names [ts] are defined several times. *)
  | Invalid_variant_construction of EzyOcamlmodules.Longident.t * int * int
    (** [Invalid_variant_construction (lid, n, m)]: Construction of a variant with name [lid], but with
      * [m] arguments instead of the expected [n] arguments. *)
  | Invalid_type_constructor of EzyOcamlmodules.Longident.t * int * int
    (** [Invalid_type_constructor (lid, n, m)]: In a type description, type constructor [lid] expects [n]
      * parameters but is used with [m] parameters. *)
  | Unbound_type_constructor of EzyOcamlmodules.Longident.t
    (** Usage of an unbound type constructor. *)
  | Error_as_heavy of (EzyOcamlmodules.Location.t * error)
    (** The set of all occuring normal errors. The location of the heavy error in the heavy error set is none. *)


type import_error =
  | Not_supported_expression of Parsetree.expression_desc
  | Not_supported_constant
  | Not_supported_core_type
  | Not_supported_structure_item of Parsetree.structure_item_desc
  | Not_supported_pattern of Parsetree.pattern_desc
  | Not_supported_type_declaration of Parsetree.type_declaration

(** Fatal errors terminate compilation directly and are reported single.
  *)
type fatal =
  (* | Parse_error of EzyCamlgrammar.ParseError.error *)
    (** Syntax error, sometimes including the parsers original exception. *)
  | Import_error of import_error * string option
    (** [Import_error (err, feat_opt)] Actually valid OCaml code, but the syntactic
      * category given im [err] is disallowed by the language feature [feat] if
      * [feat_opt = Some feat] or never allowed else. *)
  | Module_not_found of EzyOcamlmodules.Longident.t
    (** Usage of an unknown module. *)
  | Other_fatal of string
    (** Different errors which should not occur in a correctly configured system. *)

(** Values of this record are used to modify the output for endpoints in type
  * errors. The wrapper functions are given in a record to prevent the
  * monomophicity of arguments.
  *)
type endpoint_wrapper = {
  wrap_endpoint1 : 'a . (Format.formatter -> 'a -> unit) endomorph ;
  wrap_endpoint2 : 'a . (Format.formatter -> 'a -> unit) endomorph ;
}

(** Some i18n'ed error printing code as a default. Should be used to keep messages consistent. *)
val print_type_error_desc : w:(endpoint_wrapper option) -> Format.formatter -> type_error -> unit
val print_error_desc : Format.formatter -> error -> unit
val print_heavy_error_desc : Format.formatter -> heavy_error -> unit
val print_fatal_error_desc : Format.formatter -> fatal -> unit

open EzyUtils
open EzyTypingCoreTypes

module Error : PrintableOrderedType with type t = EzyOcamlmodules.Location.t * error
module ErrorSet : Set.S with type elt = Error.t
module HeavyError : sig
  include PrintableOrderedType with type t = EzyOcamlmodules.Location.t * heavy_error
  val from_error : Error.t -> t
end
module HeavyErrorSet : sig
  include Set.S with type elt = HeavyError.t
  val add_errors : ErrorSet.t -> t -> t
end

(** To register arbitrary error reporting code, just call this function with a name
  * and appropriate printers. 
  * This may happen in some module which is given to the compiler with flat -easyerrorprinter *)
val register :
  string ->
  ?print_valid:(program:string lazy_t -> (Ty.t, Path.t, Ident.t, Ty.t) EzyAst.structure -> Format.formatter -> unit) ->
  (program:string lazy_t -> EzyAst.imported_structure -> Format.formatter -> ErrorSet.t -> unit) ->
  (program:string lazy_t -> EzyAst.imported_structure -> Format.formatter -> HeavyErrorSet.t -> unit) ->
  (program:string lazy_t -> Location.t -> Format.formatter -> fatal -> unit) ->
  unit

val print_errors :
  unit -> program:string lazy_t -> EzyAst.imported_structure -> Format.formatter -> ErrorSet.t -> unit
val print_heavies :
  unit -> program:string lazy_t -> EzyAst.imported_structure -> Format.formatter -> HeavyErrorSet.t -> unit
val print_fatal :
  unit -> program:string lazy_t -> EzyOcamlmodules.Location.t -> Format.formatter -> fatal -> unit
(* val print_parse_error : *)
(*   Format.formatter -> EzyCamlgrammar.ParseError.Loc.t -> EzyCamlgrammar.ParseError.error -> unit *)

(** {2 Internal functions} *)


type some_errors = Errors of ErrorSet.t | Heavies of HeavyErrorSet.t

type annotated_errors = private {
  errors : some_errors;
  ast : EzyAst.imported_structure;
  ann_program : string lazy_t;
}
exception AnnotatedError of annotated_errors

type fatal_info = private {
  error : fatal;
  opt_loc : EzyOcamlmodules.Location.t option;
  fat_program : string lazy_t;
}
exception Fatal of fatal_info

(** EasyOCaml uses the following [raise_fatal] and [raise_annotated_error] functions to terminate 
  * parsing and typechecking in compination with [wrap_exception_with_program] which furnishes a
  * possible exceptions with the program code for nice error reporting.
  *)
val raise_fatal : ?loc:EzyOcamlmodules.Location.t -> fatal -> 'a
val raise_annotated_error: some_errors -> EzyAst.imported_structure -> 'a
val wrap_exception_with_program: string lazy_t -> (unit -> 'a) -> 'a

(* Wrapper of the above [print_(errors|heavies|fatal|parse_error)] for usage in driver/errors.ml. *)
val report_annotated_errors: Format.formatter -> annotated_errors -> unit
val report_fatal: Format.formatter -> fatal_info -> unit
(* val report_parse_error: Format.formatter -> EzyOcamlmodules.Location.t -> string lazy_t -> EzyCamlgrammar.ParseError.error -> unit *)
val report_valid: Format.formatter -> string lazy_t -> (Ty.t, Path.t, Ident.t, Ty.t) EzyAst.structure -> unit
