open Core
open EzyOcamlmodules
open EzyTypingCoreTypes
open EzyUtils.Infix
open EzyUtils
open EzyErrors

let print_type_error_dt ppf =
  let rough_ty_print ppf ty =
    match ty with
      | Ty.Var _ ->
          Ty.print ppf ty
      | Ty.Tuple (label, _) ->
          Format.fprintf ppf "Tupel (an Position %a)" ExtLocation.print label
      | Ty.Arrow (label, _, _) ->
          Format.fprintf ppf "Funktion (an Position %a)" ExtLocation.print label
      | Ty.Constr (label, path, args) ->
  (*         Format.fprintf ppf "%s %d" (Path.name path) (List.length args) in *)
          Format.fprintf ppf "%s (an Position %a)" (Path.name path) ExtLocation.print label in
  function
    | ConstructorClash (ty1, ty2) ->
        Format.fprintf ppf "Konflikt bei Typkonstruktoren: %a vs. %a"
          rough_ty_print ty1 rough_ty_print ty2
    | ArityClash (ty1, ty2, ar1, ar2) ->
        Format.fprintf ppf "Falsche Anzahl an Parametern: %d%a vs. %d%a"
          ar1 ExtLocation.print (Ty.get_label ty1) ar2 ExtLocation.print (Ty.get_label ty2)
    | CircularType (ty1, ty2) ->
        Format.fprintf ppf "Zirkulärer Typ: %a%a vs. %a%a"
          Ty.print ty1 ExtLocation.print (Ty.get_label ty1) Ty.print ty2 ExtLocation.print (Ty.get_label ty2)

let print_error_dt ppf =
  function
    | Missing_fields (tyctor, lis) ->
        Format.fprintf ppf "Die Felder %a sind für den Rekord-Typen %a nicht definiert."
          (format_list Format.pp_print_string ", ") lis Longident.print tyctor
    | Unbound_variable lid ->
        Format.fprintf ppf "Die Variable %a ist nicht gebunden."
          Longident.print lid
    | Mutable_content lid ->
        Format.fprintf ppf "Das Rekord-Feld %a ist nicht veränderbar."
          Longident.print lid
    | Type_errors (errs, ast) ->
        assert (errs <> []) ;
        let aux ppf (err, locs) =
          let sliced_ast = EzyErrorReportUtils.create_slices ast locs in
          Format.fprintf ppf "@[<2>* Typefehler: %a@ @[. Locs: @[%a@]@\n. Slice: %a@]@]"
            print_type_error_dt err
            (format_list ExtLocation.print ",@ ") (ExtLocationSet.elements locs)
            (fun ppf -> List.iter (EzyAst.print_structure_item () ppf)) sliced_ast in
        Format.fprintf ppf "@[<2>Type errors (%d)@ %a@]"
          (List.length errs)
          (format_list aux "@ ") errs
    | No_subtype (tx, ty) ->
        Format.fprintf ppf "Der folgende Ausdruck hat den Typ %a und ist nicht kompatibel mit dem Typ %a."
          Ty.print tx EzyAst.print_core_type ty

let print_report_import_error_dt ppf = function
  | Not_supported_expression expr ->
      Format.fprintf ppf "Dieser Ausdruck wird noch nicht vom EzyOcaml Typchecker unterstützt."
  | Not_supported_structure_item expr ->
      Format.fprintf ppf "Diese Struktur wird noch nicht vom EzyOcaml Typchecker unterstützt."
  | Not_supported_pattern pat ->
      Format.fprintf ppf "Dieses Pattern wird noch nicht vom EzyOcaml Typchecker unterstützt." 
  | Not_supported_constant ->
      Format.fprintf ppf "Diese Konstante wird noch nicht vom EzyOcaml Typchecker unterstützt." 
  | Not_supported_core_type ->
      Format.fprintf ppf "Dieser Typ wird noch nicht vom EzyOcaml Typchecker unterstützt." 
  | Not_supported_type_declaration _ ->
      Format.fprintf ppf "Diese Typdeklaration wird noch nicht vom EzyOcaml Typchecker unterstützt." 

let print_record_heavy_dt ppf = 
  let pp = format_list Longident.print ", " in
  function
    | Alien_fields (p, lis) ->
        Format.fprintf ppf " - Diese(s) Feld(er) %a des Records %a sind Teil eines anderen Rekordstyps."
          pp (List.map fst lis) Path.print p
    | Unknown_fields lis ->
        Format.fprintf ppf " - Diese(s) Feld(er) %a sind unbekannt."
          pp lis
    | Fields_bound_several_times fs ->
        Format.fprintf ppf " - Diese(s) Feld(er) %a sind mehrfach gebunden worden."
          pp fs
    | No_fields ->
        Format.fprintf ppf " - Für diesen Record wurden noch keine Felder deklariert."

let print_heavy_error_dt ppf = function
  | Several_bindings names ->
      Format.fprintf ppf "Die Variable(n) %a sind mehrfach gebunden worden."
        (format_list Format.pp_print_string ", ") names
  | Different_bindings ([], only_right) ->
      Format.fprintf ppf "Die Variable(n) %a sind nur auf der rechten Seite des Or-Patterns gebunden."
        (format_list Format.pp_print_string ", ") only_right
  | Different_bindings (only_left, []) ->
      Format.fprintf ppf "Die Variable(n) %a sind nur auf der linken Seite des Or-Patterns gebunden." 
        (format_list Format.pp_print_string ", ") only_left
  | Different_bindings (only_left, only_right) ->
      Format.fprintf ppf "Die Variable(n) %a sind nur auf der linken Seite, die Variable(n) %a nur auf der rechten Seite des Or-Patterns gebunden."
        (format_list Format.pp_print_string ", ") only_left
        (format_list Format.pp_print_string ", ") only_right
  | Invalid_variant_construction (lid, expected, real) ->
      Format.fprintf ppf "Der Konstruktor %a erwartet %d Argument(e),@ wurde aber auf %d Argument(e) angewandt."
        Longident.print lid expected real
  | Invalid_record errs ->
      Format.fprintf ppf "Fehler in der Rekorddefinition: %a"
        (format_list print_record_heavy_dt "@\n") errs
  | Unknown_variant lid ->
      Format.fprintf ppf "Ungebundener Konstruktor %a." Longident.print lid
  | Type_variables_not_generalized (nm, _) ->
      Format.fprintf ppf "Typ der Variablen %s ist nicht inferierbar." nm
  | Invalid_type_constructor (lid, n, m) ->
      Format.fprintf ppf "Der Typkonstruktor %a erwartet %d Argument(e),@ wurde aber auf %d Argument(e) angewandt."
        Longident.print lid
        n m
  | Unbound_type_constructor lid ->
      Format.fprintf ppf "Ungebundener Typkonstruktor %a." Longident.print lid
  | Error_as_heavy err ->
      print_error_dt ppf err
  | Type_names_not_unique li ->
      Format.fprintf ppf "Die Namen der Typen %a sind nicht einmalig" (format_list Format.pp_print_string ", ") li

let print_fatal_dt ppf = function
  | Letrec_invalid_pattern ->
      Format.pp_print_string ppf "Auf der linken Seite von `let rec' sind nur Variablen erlaubt."
  | Import_error err ->
      Format.fprintf ppf "Fehler beim Importieren: %a" print_report_import_error_dt err
  | Module_not_found lid ->
      Format.fprintf ppf "Module %a kann nicht gefunden werden." Longident.print lid
  | Other_fatal msg ->
      Format.pp_print_string ppf msg
  | Syntax_error None ->
      Format.fprintf ppf "Ein syntaktischer Fehler"
  | Syntax_error (Some (Stream.Error err)) ->
      Format.fprintf ppf "Ein syntaktischer Fehler: %s" err
  | Syntax_error (Some exn) ->
      Format.fprintf ppf "Ein syntaktischer Fehler: %a" Camlp4.ErrorHandler.print exn

let _ =
  print_endline "EzyOcaml ErrorReport (deutsch)!" ;
  EzyErrors.set_printer print_error_dt print_heavy_error_dt print_fatal_dt
