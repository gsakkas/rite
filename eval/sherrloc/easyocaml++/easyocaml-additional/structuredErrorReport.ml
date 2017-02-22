
(**
  * StructuredErrorReport is a error reporting plugin for EasyOcaml for structured
  * error output, namely either XML or S-Expressions.
  *)

open EzyUtils
open EzyOcamlmodules
let logger = new Logger.logger "StructuredErrorReport"

type output_type = [ `Xml | `Sexp ]
let output_type_env_var = "EZY_STRUCTURED_ERROR_TYPE"


(* This module implements a general data type for tree like structured data and
 * both output facilities for XML as well as Sexp.
 *)
module Structured : sig
  type content =
    | Node of string * (string * string) list * content list
    | Leaf of string
  val print_sexp : Format.formatter -> content -> unit
  val print_xml : Format.formatter -> content -> unit
end = struct
  type content =
    | Node of string * (string * string) list * content list
    | Leaf of string

  let space_if_not_empty ppf li =
    if li <> [] then Format.fprintf ppf "@ "

  let (++) f g =
    fun ppf li ->
      f ppf li ; g ppf li

  let print_sexp =

    let print_attrs ppf attrs =
      let p ppf (key, value) = Format.fprintf ppf "@ (%s@ %S)" key value in
      Format.fprintf ppf "@[<2>" ;
      List.iter (p ppf) attrs ;
      Format.fprintf ppf "@]" in

    let rec print_content ppf = function
      | Node (name, attrs, children) ->
          Format.fprintf ppf "@[<2>(%s%a%a)@]"
            name
            print_attrs attrs
            print_contents children
      | Leaf str ->
          Format.fprintf ppf "%S" str
    and print_contents ppf contents =
      let p ppf content = Format.fprintf ppf "@ %a" print_content content in
      List.iter (p ppf) contents in

    print_content

  let print_xml =

    let print_attrs ppf attrs =
      let p ppf (key, value) = Format.fprintf ppf "@ %s=%S" key value in
      Format.fprintf ppf "@[" ;
      List.iter (p ppf) attrs ;
      Format.fprintf ppf "@]" in

    let rec print_content ppf = function
      | Node (name, attrs, children) ->
          Format.fprintf ppf "@[<4><%s%a"
            name
            print_attrs attrs ;
          if children = [] then
            Format.fprintf ppf " />@]"
          else
            Format.fprintf ppf ">@\n%a@]@\n</%s>"
              print_contents children name
      | Leaf str -> Format.pp_print_string ppf str
    and print_contents ppf contents =
      Format.fprintf ppf "@[%a@]" (List.print print_content "@,") contents in

    print_content
end


(* This module contains functions to convert easyocaml's error data to structured data.
 *)
module ErrorToStructured = struct
  open Structured

  let position pos =
    Node ("position", [
      "fname", pos.Lexing.pos_fname ;
      "lnum", string_of_int pos.Lexing.pos_lnum ;
      "bol", string_of_int pos.Lexing.pos_bol ;
      "cnum", string_of_int pos.Lexing.pos_cnum ;
    ], [])

  let code_location ?(endpoint=false) loc =
    Node ("code_location", [
      "endpoint", if endpoint then "yes" else "no"
    ], [
      position loc.Location.loc_start;
      position loc.Location.loc_end ;
    ])

  let interface_location lid =
    let attrs = [
      "element", format_str "%a" Longident.print lid ;
    ] in
    Node ("interface_location", attrs, [])

  let location ?(endpoint=false) eloc =
    match eloc with
      | ExtLocation.Source loc ->
          code_location ~endpoint loc
      | ExtLocation.Interface iloc ->
          assert (endpoint = false) ;
          interface_location iloc

  let error_description str =
    Node ("error_description", [], [Leaf str])

  let error_description_for_fmt f x =
    Node ("error_description", [], [Leaf (format_str "%a" f x)])

  let fatal_error desc loc =
    Node ("fatal_error", [], [
      error_description desc ;
      code_location loc ;
    ])

  let standard_error desc loc =
    Node ("standard_error", [], [
      error_description desc ;
      code_location loc ;
    ])

  let locations ann_elocs =
    let aux (endpoint, eloc) = location ~endpoint eloc in
    Node ("locations", [], List.map aux ann_elocs)

  let type_error desc ann_elocs =
    Node ("type_error", [], [
      error_description desc ;
      locations ann_elocs ;
    ])

  let error = function
    | `Normal (_, EzyErrors.Type_error (te, elocs)) ->
        let endpoints =
          match te with
            | EzyErrors.ConstructorClash (ty1, ty2)
            | EzyErrors.ArityClash (ty1, ty2, _, _)
            | EzyErrors.CircularType (ty1, ty2) ->
                let aux x = try [EzyTypingCoreTypes.Ty.get_label x] with _ -> [] in
                aux ty1 @ aux ty2 in
        type_error (format_str "%a" (EzyErrors.print_type_error_desc ~w:None) te)
          (List.map (fun eloc -> List.mem eloc endpoints, eloc) (ExtLocationSet.elements elocs))
    | `Normal (loc, err)
    | `Heavy (_, EzyErrors.Error_as_heavy (loc, err)) ->
        Node ("error", [], [
          error_description_for_fmt EzyErrors.print_error_desc err ;
          code_location loc ;
        ])
    | `Heavy (loc, err) ->
        Node ("error", [], [
          error_description_for_fmt EzyErrors.print_heavy_error_desc err ;
          code_location loc ;
        ])

  let errors errs = 
    Node ("errors", [], List.map error errs)

  let compile_result cr =
    Node ("compile_result", [], [
      match cr with
        | `Fatal_error (loc, fatal) ->
            let desc = format_str "%a" EzyErrors.print_fatal_error_desc fatal in
            fatal_error desc loc
        | `Errors errs ->
            errors errs
    ])
end

(* --------------- *)

let print_document' = function
  | `Xml -> begin fun ppf content ->
      Format.pp_print_string ppf "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" ;
      Format.pp_print_string ppf "<!DOCTYPE compile_result SYSTEM \"easyerrors.dtd\">\n" ;
      Structured.print_xml ppf content ;
      Format.pp_print_newline ppf ()
    end
  | `Sexp -> begin fun ppf content ->
      Structured.print_sexp ppf content ;
      Format.pp_print_newline ppf ()
    end


(* --------------- *)

open ErrorToStructured

let register output_type =
  let name = "StructuredErrorReport" in

  let print_errors ~program ast ppf errs =
    let errors = List.map (fun loc_err -> `Normal loc_err) (EzyErrors.ErrorSet.elements errs) in
    print_document' output_type ppf (compile_result (`Errors errors)) in

  let print_heavies ~program ast ppf heavies =
    let mapper = function
      | (_, EzyErrors.Error_as_heavy loc_err) -> `Normal loc_err
      | (loc, err) -> `Heavy (loc, err) in
    let errors = List.map mapper (EzyErrors.HeavyErrorSet.elements heavies) in
    print_document' output_type ppf (compile_result (`Errors errors)) in

  let print_fatal ~program loc ppf fatal =
    print_document' output_type ppf (compile_result (`Fatal_error (loc, fatal))) in

  EzyErrors.register name print_errors print_heavies print_fatal


let _ =
  let output_type =
    try
      if Sys.getenv output_type_env_var = "sexp"
      then `Sexp
      else `Xml
    with Not_found -> `Xml in
  logger#info "Set output type to %s" (match output_type with `Xml -> "XML" | `Sexp -> "Sexp");
  register output_type

