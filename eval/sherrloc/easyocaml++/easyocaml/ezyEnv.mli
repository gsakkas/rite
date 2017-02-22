open EzyOcamlmodules
open EzyUtils
open EzyTypingCoreTypes
open EzyConstraints

(** Build in types. The ExtLocation.t given to the constructors is the witness
  * for the given type.  This is needed for the endpoints in type constructor
  * clashes. *)
module EzyPredef : sig
  val bool_type: ExtLocation.t -> Ty.t
  val unit_type: ExtLocation.t -> Ty.t
  val exn_type: ExtLocation.t -> Ty.t
  val int_type: ExtLocation.t -> Ty.t
  val array_type: ExtLocation.t -> Ty.t -> Ty.t
end

type binding = Mono | Poly

type value_desc = {
  val_ty: Ty.t ;
  val_kind: Types.value_kind ;
  val_binding : binding ;
  val_constraints: AtConstrSet.t ;
  val_loc: ExtLocation.t ;
}

type type_kind =
  | Abstract
  | Synonym of Ty.t
  | Variant of Ty.t list StringMap.t
  | Record of (EzyAsttypes.mutable_flag * Ty.t) StringMap.t

type type_decl = {
  type_params: Ty.t list ;
  type_kind: type_kind ;
  type_loc: ExtLocation.t ;
}

type ctor_tag =
  | Ctor_regular of Path.t
  | Ctor_exception of Path.t

val path_of_tag: ctor_tag -> Path.t

type ctor_desc = {
  ctor_result: Ty.t ;
  ctor_args: Ty.t list ;
  ctor_tag: ctor_tag ;
}

type field_desc = {
  fld_result: Ty.t ;
  fld_arg: Ty.t ;
  fld_mutable: EzyAsttypes.mutable_flag ;
  fld_path: Path.t ;
}

type t = {
  values: (Path.t * value_desc) Ident.tbl ;
  types: (Path.t * type_decl) Ident.tbl ;
  modules: (Path.t * t) Ident.tbl ;
  ctors: ctor_desc StringMap.t ;
  fields: field_desc StringMap.t ;
}

val empty: t

val allow_modules : string list -> unit
val forbid_modules : string list -> unit

val find_pers_struct: Ident.t -> t 

(* Add a value or type by Ident.t to the environment *)
val add_value: Ident.t -> value_desc -> t -> t
val add_type: Ident.t -> type_decl -> t -> t

(* Enter a value or type by name *)
val enter_value: string -> value_desc -> t -> Ident.t * t
val enter_type: string -> type_decl -> t -> Ident.t * t (* adds ctors / fields *)
val enter_exception: string -> Ty.t list -> t -> Ident.t * t

val find_value: Path.t -> t -> value_desc
val find_type: Path.t -> t -> type_decl
val find_module: Path.t -> t -> t

(* Lookup a value, type, constructor, field or module by Longident.t. *)
val lookup_value: Longident.t -> t -> Path.t * value_desc
val lookup_type: Longident.t -> t -> Path.t * type_decl
val lookup_ctor: ?tyvarmap:TyVar.t TyVarMap.t -> Longident.t -> t -> TyVar.t TyVarMap.t * ctor_desc
val lookup_field: ?tyvarmap:TyVar.t TyVarMap.t -> Longident.t -> t -> TyVar.t TyVarMap.t * field_desc
val lookup_module: Longident.t -> t -> Path.t * t


val import: Env.t -> t
val import_signature: Path.t -> Types.signature -> t
val open_module: string -> t -> Ident.t * t


val cyclic_abbrev: t -> Ty.t -> bool
val expand_type: t -> Ty.t -> Ty.t
val full_expand_type: t -> Ty.t -> Ty.t

val print: ?s:TyVarSubst.t -> bool -> Format.formatter -> t -> unit
val print_cons: Format.formatter -> bool -> t -> unit
val print_constructor: Format.formatter -> bool -> t -> unit
val print_cons_in_kind: Format.formatter -> t -> unit
