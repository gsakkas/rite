open EzyOcamlmodules
open EzyTypingCoreTypes
open EzyUtils.Infix
open EzyUtils
open EzyAst

let logger = new Logger.logger "ezyErrors"

type type_error =
  | ConstructorClash of Ty.t * Ty.t
  | ArityClash of Ty.t * Ty.t * int * int
  | CircularType of Ty.t * Ty.t
type error =
  | Type_error of type_error * ExtLocationSet.t
  | Unbound_variable of Longident.t
  | Mutable_content of Longident.t
  | Missing_fields of Longident.t * string list (* [Missing_fields (lid, strs)] the fields [strs] are missing for the record of type [lid] *)
  | Unknown_field of Longident.t
  | No_subtype of Ty.t * Parsetree.core_type
type import_error =
  | Not_supported_expression of Parsetree.expression_desc
  | Not_supported_constant
  | Not_supported_core_type
  | Not_supported_structure_item of Parsetree.structure_item_desc
  | Not_supported_pattern of Parsetree.pattern_desc
  | Not_supported_type_declaration of Parsetree.type_declaration
type record_heavy =
  | Alien_fields of Path.t * (Longident.t * Path.t) list
    (** Fields from different records are intermixed *)
  | Unknown_fields of Longident.t list 
    (** Fields of a record construction are unknown *)
  | Fields_bound_several_times of Longident.t list
  | No_fields
    (** No fields are given in a record construction. Syntactically possible? *)
type heavy_error =
  | Several_bindings of string list
  | Different_bindings of string list * string list
  | Invalid_record of record_heavy list
  | Unknown_variant of Longident.t
  | Type_variables_not_generalized of string * Ty.t
  | Type_names_not_unique of string list
  | Invalid_variant_construction of Longident.t * int * int
  | Invalid_type_constructor of Longident.t * int * int (* name of the ctor + expected argument count + applied argument count *)
  | Unbound_type_constructor of Longident.t
  | Error_as_heavy of (Location.t * error)

type fatal = 
  (* | Parse_error of EzyCamlgrammar.ParseError.error *)
  | Import_error of import_error * string option
  | Module_not_found of Longident.t
  | Other_fatal of string

(* Errors {{{ *)

(** Errors which permit further processing. *)
module Error = struct
  type t = Location.t * error
  type printable = t
  let print ppf _ = failwith "no printer for Error.t"
  let compare =
    lexical2 Pervasives.compare Pervasives.compare
end
module ErrorSet = Set.Make(Error)

(** Errors which stop any further generation, unification 
    or any other processes 
*)
module HeavyError = struct
  type t = Location.t * heavy_error
  type printable = t
  let print ppf _ = failwith "no printer for Error.t"
  let compare x y =
    lexical2 Pervasives.compare Pervasives.compare x y
  let from_error : Error.t -> t = fun (loc, err) ->
    Location.none, Error_as_heavy (loc, err)
end

module HeavyErrorSet = struct
  include Set.Make(HeavyError)
  let add_errors errs heavies =
    let aux err sofar = add (HeavyError.from_error err) sofar in
    ErrorSet.fold aux errs heavies
end

(* }}} *)

open Format

type lang = [ `En | `Fr | `De ]

let lang : lang =
  let default = `En in
  let lang_specs = ["en", `En; "fr", `Fr; "de", `De] in
  let rec decode lang_code = function
    | (prefix, lang) :: rem ->
        if lang_code = prefix || String.check_prefix lang_code (prefix ^ "_")
        then lang
        else decode lang_code rem
    | [] -> raise Not_found in
  let rec find = function
    | [] ->  default
    | var :: rem ->
        begin try
          decode (Sys.getenv var) lang_specs
        with Not_found ->
          find rem
        end in
  find ["LANGUAGE"; "LANG"]

let _ = logger#info "Selected language: %s" (match lang with `En -> "en" | `Fr  -> "fr" | `De -> "de")

open Format

let rough_ty_print =
  match lang with
    | `En -> begin fun ppf -> function
        | Ty.Var _  as ty ->
            Ty.print ppf ty
        | Ty.Tuple (label, _) ->
            fprintf ppf "tuple"
        | Ty.Arrow (label, _, _) ->
            fprintf ppf "function"
        | Ty.Constr (label, path, args) ->
            fprintf ppf "%s" (Path.name path)
      end 
    | `Fr -> not_implemented "EzyErrors.rough_ty_print (french)" 
    | `De -> begin fun ppf -> function
        | Ty.Var _ as ty ->
            Ty.print ppf ty
        | Ty.Tuple (label, _) ->
            fprintf ppf "Tupel" 
        | Ty.Arrow (label, _, _) ->
            fprintf ppf "Funktion" 
        | Ty.Constr (label, path, args) ->
            fprintf ppf "%s" (Path.name path)
      end

let slice ppf =
  pp_print_string ppf
    (match lang with
       | `En | `De -> "Slice"
       | `Fr -> not_implemented "EzyErrors.ezyErrors.slice (french)")

let at =
  match lang with
    | `En -> (fun ppf -> pp_print_string ppf "at")
    | `De -> (fun ppf -> pp_print_string ppf "an der Stelle")
    | `Fr -> not_implemented "EzyErrors.at (french)"


let print_tuple = 
  match lang with
    | `En -> begin fun ppf -> function
        | 1 -> pp_print_string ppf "single value"
        | 2 -> pp_print_string ppf "pair"
        | 3 -> pp_print_string ppf "triple"
        | n -> fprintf ppf "%d-tuple" n
      end
    | `Fr -> not_implemented "EzyErrors.print_tuple (french)"
    | `De -> begin fun ppf -> function
        | 1 -> pp_print_string ppf "einzelner Wert"
        | 2 -> pp_print_string ppf "Paar"
        | 3 -> pp_print_string ppf "Triple"
        | 4 -> pp_print_string ppf "Quartupel"
        | n -> fprintf ppf "%d-Tupel" n
      end

let similar_types = function
  | Ty.Tuple (_, args1), Ty.Tuple (_, args2) ->
      List.length args1 = List.length args2
  | Ty.Constr (_, p1, _), Ty.Constr (_, p2, _) ->
      Path.same p1 p2
  | Ty.Arrow _, Ty.Arrow _ ->
      true
  | _ -> false

type endpoint_wrapper = {
  wrap_endpoint1 : 'a . (Format.formatter -> 'a -> unit) -> Format.formatter -> 'a -> unit ;
  wrap_endpoint2 : 'a . (Format.formatter -> 'a -> unit) -> Format.formatter -> 'a -> unit ;
}

let print_type_error_desc ~w =
  let w = Option.value ~default:{wrap_endpoint1 = id; wrap_endpoint2 = id} w in
  match lang with
    | `En -> begin fun ppf -> function
        | ConstructorClash (ty1, ty2) (* when similar_types (ty1, ty2) ->
            fprintf ppf "Type constructor clash between %a and %a"
              Ty.print ty1 Ty.print ty2
        | ConstructorClash (ty1, ty2) *) ->
            fprintf ppf "Type constructor clash between %a and %a"
              (w.wrap_endpoint1 rough_ty_print) ty1
              (w.wrap_endpoint2 rough_ty_print) ty2
        | ArityClash (ty1, ty2, ar1, ar2) ->
            fprintf ppf "Arity clash, %a vs. %a"
              (w.wrap_endpoint1 print_tuple) ar1
              (w.wrap_endpoint2 print_tuple) ar2
        | CircularType (ty1, ty2) ->
            fprintf ppf "Circular type, %a vs. %a"
              (w.wrap_endpoint1 Ty.print) ty1
              (w.wrap_endpoint2 Ty.print) ty2
      end
    | `Fr -> not_implemented "EzyErrors.print_type_error_desc (french)"
    | `De -> begin fun ppf -> function
        | ConstructorClash (ty1, ty2) when similar_types (ty1, ty2) ->
            fprintf ppf "Kollision zwischen Werten der Typen %a und %a"
              (w.wrap_endpoint1 Ty.print) ty1 (w.wrap_endpoint2 Ty.print) ty2
        | ConstructorClash (ty1, ty2) ->
            fprintf ppf "Kollision zwischen Werten der Typen %a und %a"
              (w.wrap_endpoint1 rough_ty_print) ty1 (w.wrap_endpoint2 rough_ty_print) ty2
        | ArityClash (ty1, ty2, ar1, ar2) ->
            fprintf ppf "Ein %a anstatt eines %a"
              (w.wrap_endpoint1 print_tuple) ar1 (w.wrap_endpoint2 print_tuple) ar2
        | CircularType (ty1, ty2) ->
            fprintf ppf "Zirkulaerer typ: %a vs. %a"
              (w.wrap_endpoint1 Ty.print) ty1 (w.wrap_endpoint2 Ty.print) ty2 
      end

let print_error_desc =
  match lang with
    | `En -> begin fun ppf -> function
        | Type_error (err, locs) ->
            fprintf ppf "Type error"
        | Missing_fields (tyctor, lis) ->
            fprintf ppf "The fields %a for record type %a are not defined"
              (List.print pp_print_string ", ") lis Longident.print tyctor
        | Unknown_field lid ->
            fprintf ppf "There is no record with a field named %a"
              Longident.print lid          
        | Unbound_variable lid ->
            fprintf ppf "The variable %a is unbound"
              Longident.print lid
        | Mutable_content lid ->
            fprintf ppf "The record field %a is not mutable"
              Longident.print lid
        | No_subtype (tx, ty) ->
            fprintf ppf "This expression of type %a cannot be constrained to type %a"
              Ty.print tx EzyAst.print_core_type ty
      end
    | `De -> begin fun ppf -> function
        | Type_error (err, locs) ->
            fprintf ppf "Typfehler"
        | Missing_fields (tyctor, lis) ->
            fprintf ppf "Die Feld(er) %a fehlen fuer die Konstruktion eines Records vom Typ %a"
              (List.print pp_print_string ", ") lis Longident.print tyctor
        | Unknown_field lid ->
            fprintf ppf "Feldname %a ist unbekannt"
              Longident.print lid          
        | Unbound_variable lid ->
            fprintf ppf "Die Variable %a ist unbekannt"
              Longident.print lid
        | Mutable_content lid ->
            fprintf ppf "Das Record Feld %a ist nicht aenderbar (mutable)"
              Longident.print lid
        | No_subtype (tx, ty) ->
            fprintf ppf "Ungueltige Typannotation fuer einen Wert vom Typ %a"
              Ty.print tx
      end
    | `Fr -> not_implemented "EzyErrors.print_error (french)"

let print_error ~program ast ppf (loc, error) =
   match error with
    | Type_error (err, locs) ->
        let sliced_ast = EzyErrorReportUtils.create_slices ast locs in
        fprintf ppf "@[<3> * %a: %a@\n%t:@ %a@]"
          print_error_desc error
          (print_type_error_desc ~w:None) err
          slice
          (fun ppf -> List.iter (EzyAst.print_structure_item () ppf)) sliced_ast
    | _ ->
        fprintf ppf "@[<3> * %a@ (%t %a)@]"
          print_error_desc error at Location.print loc

let print_record_heavy =
  let pp = List.print Longident.print ", " in
  match lang with
    | `En | `De -> begin fun ppf -> function
        | Alien_fields (p1, lis) ->
            let aux ppf (lid, p2) =
              fprintf ppf "field %a belongs to %s" Longident.print lid (Path.name p2) in
            fprintf ppf "@[<3> * The field does not belong to type %s: %a"
              (Path.name p1) (List.print aux ", ") lis
        | Unknown_fields lis ->
            fprintf ppf "@[<3> * The field(s) %a are unknown"
              pp lis
        | Fields_bound_several_times fs ->
            fprintf ppf "@[<3> * The field(s) %a are bound several times"
              pp fs
        | No_fields ->
            fprintf ppf "@[<3> * Not a single fields of this record is defined"
      end
    | `Fr -> not_implemented "EzyErrors.print_record_heavy (french)"

let print_heavy_error_desc =
  match lang with
    | `En | `De -> begin fun ppf -> function
        | Several_bindings names ->
            fprintf ppf "The variables %a are bound several times"
              (List.print pp_print_string ", ") names
        | Different_bindings ([], only_right) ->
            fprintf ppf "The variables %a are only bound on the right hand side of the or pattern"
              (List.print pp_print_string ", ") only_right
        | Different_bindings (only_left, []) ->
            fprintf ppf "The variables %a are only bound on the left hand side of the or pattern"
              (List.print pp_print_string ", ") only_left
        | Different_bindings (only_left, only_right) ->
            fprintf ppf "The variables %a are only bound on the left hand side of the or pattern and %a are only bound on the right hand side"
              (List.print pp_print_string ", ") only_left
              (List.print pp_print_string ", ") only_right
        | Invalid_variant_construction (lid, expected, real) ->
            fprintf ppf "The constructor %a expexts %d argument(s)@ but is here applied to %d argument(s)"
              Longident.print lid expected real
        | Invalid_record errs ->
            fprintf ppf "Errors in record definition:@ @[%a@]"
              (List.print print_record_heavy "@ ") errs
        | Unknown_variant lid ->
            fprintf ppf "Unbound constructor %a" Longident.print lid
        | Type_variables_not_generalized (nm, _) ->
            fprintf ppf "Variable %s is monomorph and contains type variables (thus cannot be generalized)" nm
        | Type_names_not_unique nms ->
            fprintf ppf "The type names %a are not unique in this module" (List.print pp_print_string ", ") nms
        | Invalid_type_constructor (lid, n, m) ->
            fprintf ppf "The type constructor %a expects %d argument(s), but is here applied to %d argument(s)"
              Longident.print lid n m
        | Unbound_type_constructor lid ->
            fprintf ppf "Unbound type constructor %a" Longident.print lid
        | Error_as_heavy err ->
            failwith "print_heavy_error_desc"
      end
    | `Fr -> not_implemented "EzyErrors.print_heavy (french)"

let print_heavy ~program ast ppf (loc, heavy) =
  match heavy with
    | Error_as_heavy error ->
        print_error ~program ast ppf error
    | _ ->
      fprintf ppf "@[<3> * %a@ (%t %a)@]"
        print_heavy_error_desc heavy at Location.print loc

let print_errors_default ~program ast ppf errors =
  fprintf ppf "@[%a@]@?"
    (List.print (print_error ~program ast) "@\n")
    (ErrorSet.elements errors)

let print_heavies_default ~program ast ppf heavies =
  fprintf ppf "@[%a@]@?"
    (List.print (print_heavy ~program ast) "@\n")
    (HeavyErrorSet.elements heavies)

(* let print_specific_parse_error_desc = *)
(*   match lang with *)
(*     | `En | `Fr -> begin fun ppf err -> *)
(*         pp_print_string ppf (EzyCamlgrammar.ParseError.SpecificError.to_string err) *)
(*       end *)
(*     | `De -> begin fun ppf -> function *)
(*         | Camlp4.Sig.OCamlSpecificError.Currified_constructor -> *)
(*             pp_print_string ppf "Gecurryter Konstruktor" *)
(*         | Camlp4.Sig.OCamlSpecificError.Not_an_identifier pos -> *)
(*             let pos = *)
(*               match pos with *)
(*                 | Camlp4.Sig.OCamlSpecificError.NotAnIdentifier.Patt -> "Pattern" *)
(*                 | Camlp4.Sig.OCamlSpecificError.NotAnIdentifier.Expr -> "Expression" *)
(*                 | Camlp4.Sig.OCamlSpecificError.NotAnIdentifier.Ctyp -> "Typ" in *)
(*             fprintf ppf "Die %s-Phrase ist kein Identifikator" pos *)
(*         | Camlp4.Sig.OCamlSpecificError.Bad_directive str -> *)
(*             fprintf ppf "Unbekanne Anweisung %s" str *)
(*       end *)

(* let print_parse_error_desc = *)
(*   match lang with *)
(*     | `En | `Fr -> begin fun ppf err ->  *)
(*         pp_print_string ppf (EzyCamlgrammar.ParseError.error_to_string err) *)
(*       end *)
(*     | `De -> *)
(*         let module Err = EzyCamlgrammar.ParseError in *)
(*         begin fun ppf -> function *)
(*           | Err.Expected (exp, None, context) -> *)
(*               fprintf ppf "%s wird erwartet (als [%s])" *)
(*                 (Err.Expected.to_string exp) context  *)
(*           | Err.Expected (exp, Some sd, context) -> *)
(*               fprintf ppf "%s wird nach %s erwartet (als [%s])" *)
(*                 (Err.Expected.to_string exp) (Err.SymbolDesc.to_string sd) context *)
(*           | Err.Illegal_begin sd -> *)
(*               fprintf ppf "Kein gültiger Anfang der syntaktischen Einheit %s" (Err.SymbolDesc.to_string sd) *)
(*           | Err.Failed -> *)
(*               pp_print_string ppf "Fehlgeschlagen" *)
(*           | Err.Specific_error err -> *)
(*               print_specific_parse_error_desc ppf err *)
(*         end *)


let print_fatal_error_desc =
  match lang with
    | `En | `Fr -> begin fun ppf -> function
        | Import_error (err, None) ->
            fprintf ppf "This feature is not supported by EasyOcaml"
        | Import_error (err, Some feat) ->
            fprintf ppf "This feature is not supported in this language level (%s)" feat
        | Module_not_found lid ->
            fprintf ppf "Module %a not found" Longident.print lid
        (* | Parse_error err -> *)
        (*     fprintf ppf "Parse error: %a" print_parse_error_desc err *)
        | Other_fatal msg ->
            pp_print_string ppf msg
        end
    | `De -> begin fun ppf -> function
        | Import_error (err, None) ->
            fprintf ppf "Das syntaktische Konstrukt ist nicht unterstuetzt in EasyOcaml"
        | Import_error (err, Some feat) ->
            fprintf ppf "Das syntaktische Konstrukt ist in diesem Sprachlevel nicht unterstuetzt (%s)" feat
        | Module_not_found lid ->
            fprintf ppf "Das Modul %a konnte nicht gefunden werden" Longident.print lid
        (* | Parse_error err -> *)
        (*     fprintf ppf "Fehler beim parsen: %a" print_parse_error_desc err *)
        | Other_fatal msg ->
            pp_print_string ppf msg
        end


let long_print_loc ppf loc =
  let print_details ppf =
    let col pos = pos.Lexing.pos_cnum - pos.Lexing.pos_bol in
    if loc.Location.loc_start.Lexing.pos_lnum = loc.Location.loc_end.Lexing.pos_lnum then
      (match lang with
         | `En | `Fr -> fprintf ppf "line %d characters %d-%d"
         | `De -> fprintf ppf "Zeile %d Zeichen %d-%d"
      ) loc.Location.loc_start.Lexing.pos_lnum
        (col loc.Location.loc_start)
        (col loc.Location.loc_end)
  else
      (match lang with
         | `En | `Fr -> fprintf ppf "line %d characters %d - line %d characters %d"
         | `De -> fprintf ppf "Zeile %d Zeichen %d - Zeile %d Zeichen %d"
      ) loc.Location.loc_start.Lexing.pos_lnum
        (col loc.Location.loc_start)
        loc.Location.loc_end.Lexing.pos_lnum
        (col loc.Location.loc_end) in
  if loc.Location.loc_start.Lexing.pos_fname = "" then
    print_details ppf 
  else
    (match lang with
       | `En | `Fr -> fprintf ppf "file %s: %t"
       | `De -> fprintf ppf "Datei %s: %t"
    ) loc.Location.loc_start.Lexing.pos_fname print_details 

let print_fatal_default ~program loc ppf fatal =
  fprintf ppf "@[<3> * " ;
  if loc <> Location.none then
    begin match lang with
       | `En | `Fr -> fprintf ppf "@[At %a@]@\n"
       | `De -> fprintf ppf "@[In %a@]@\n"
    end long_print_loc loc ;
  fprintf ppf "%a@]@." print_fatal_error_desc fatal


let print_valid_ref: (program:(string lazy_t) -> (Ty.t, Path.t, Ident.t, Ty.t) EzyAst.structure -> Format.formatter -> unit) ref =
  ref (fun ~program _ _ -> ())
let print_errors_ref = ref print_errors_default
let print_heavies_ref = ref print_heavies_default
let print_fatal_ref = ref print_fatal_default

let print_valid () = !print_valid_ref
let print_errors () = !print_errors_ref
let print_heavies () = !print_heavies_ref
let print_fatal () = !print_fatal_ref
(* let print_parse_error ppf loc err = *)
(*   logger#trace "printing parsing error" ; *)
(*   let program = lazy (failwith "program for print_parse_error not implemented") in *)
(*   print_fatal () ~program (EzyCamlgrammar.import_loc loc) ppf (Parse_error err) *)

let register name ?print_valid print_errors print_heavies print_fatal =
  logger#info "Loading error reporting plugin %s" name;
  print_valid_ref := Option.value ~default:(fun ~program _ _ -> ()) print_valid;
  print_errors_ref := print_errors;
  print_heavies_ref := print_heavies;
  print_fatal_ref := print_fatal;
              
type some_errors =
  | Errors of ErrorSet.t
  | Heavies of HeavyErrorSet.t

type annotated_errors = {
  errors: some_errors ;
  ast: EzyAst.imported_structure ;
  ann_program: string lazy_t ;
}

exception AnnotatedError of annotated_errors

type fatal_info = {
  error : fatal;
  opt_loc : EzyOcamlmodules.Location.t option;
  fat_program : string lazy_t;
}
exception Fatal of fatal_info

exception PreAnnotatedError of some_errors * EzyAst.imported_structure
exception PreFatal of fatal * EzyOcamlmodules.Location.t option

let raise_annotated_error errors ast =
  raise (PreAnnotatedError (errors, ast))

let raise_fatal ?loc s =
  raise (PreFatal (s, loc))

let wrap_exception_with_program program f =
  try
    f ()
  with
    | PreAnnotatedError (errs, ast) ->
        raise (AnnotatedError {errors = errs; ast = ast; ann_program = program})
    | PreFatal (err, opt_loc) ->
        raise (Fatal {error = err; opt_loc = opt_loc; fat_program = program})

let report_annotated_errors ppf { errors = errors; ast = ast; ann_program = program } =
  Format.pp_print_flush ppf () ;
  match errors with
    | Errors errors -> 
        print_errors () program ast ppf errors
    | Heavies heavies ->
        print_heavies () program ast ppf heavies

let report_fatal ppf { opt_loc = opt_loc; error = fatal; fat_program = program } =
  Format.pp_print_flush ppf () ;
  print_fatal () ~program (Option.value ~default:Location.none opt_loc) ppf fatal

(* let report_parse_error ppf loc program err = *)
(*   Format.pp_print_flush ppf () ; *)
(*   print_fatal () ~program loc ppf (Parse_error err) *)

let report_valid ppf program structure =
  Format.pp_print_flush ppf () ;
  print_valid () ~program structure ppf
