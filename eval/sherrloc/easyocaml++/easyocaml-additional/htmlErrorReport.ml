open EzyUtils
open EzyUtils.Infix
open EzyOcamlmodules
open EzyTypingCoreTypes
open EzyErrors
open Format

let logger = new EzyUtils.Logger.logger "htmlErrorReport"

let template () = format_of_string "
<div>
  <span id='reset' onclick='javascript:reset()' class='othererror'>reset</span>
  <p class='errorlistparagraph'>
    <ul id='errorlist'></ul>
  </p>
</div>
<br />
<div>
  <div class='code'><div class='currenterror'><span name='codeitem' id='null' />
%a
  </div></div>
</div></div>
<script type='text/javascript'>
  init([%a]);
</script>
"

let escape_quote char str =
  (* let quote_re = Str.regexp_string char in Str.global_replace quote_re (char ^ String.make 1 char) *)
  let len = String.length str in
  let buf = Buffer.create len in
  let rec aux offset =
    if offset = len
    then Buffer.contents buf
    else
      try
        let next = String.index_from str offset char in
        if next <> offset then
          Buffer.add_string buf (String.sub str offset (next - offset));
        Buffer.add_string buf ("\\" ^ String.make 1 char);
        aux (succ next)
      with Not_found ->
        Buffer.add_string buf (String.sub str offset (String.length str - offset));
        Buffer.contents buf in
  aux 0

let print_wrap f p ppf x =
  let ppf' =
    let out str ofs len =
      for i = ofs to ofs + len - 1 do
        f ppf str.[i]
      done in
    make_formatter out ignore in
  p ppf' x;
  pp_print_flush ppf' ()

let escape_char char =
  print_wrap (fun ppf -> function '\\' -> pp_print_string ppf "\\\\" | c -> if c = char then pp_print_char ppf '\\'; pp_print_char ppf c)

let dont_newline p =
  print_wrap (fun ppf -> function '\n' -> () | c -> pp_print_char ppf c) p

let loc_string loc = 
  format_str "'%a'" (escape_char '\'' Location.print) loc

let force_source = function ExtLocation.Source loc -> loc | _ -> invalid_arg "force_source"

let loc_string_for_ty ?(default="null") ty =
  Option.value ~default
    (Option.map ~f:loc_string
       (Option.for_exn (force_source << Ty.get_label) ty))


let print_error =
  let w = Some {
    wrap_endpoint1 = (fun p ppf -> fprintf ppf "<span class='endpoint1'>%a</span>" p);
    wrap_endpoint2 = (fun p ppf -> fprintf ppf "<span class='endpoint2'>%a</span>" p);
  } in
  fun ppf (loc, err) ->
    pp_set_margin ppf (pp_get_max_indent ppf ());
    match err with
      | Type_error (terr, err_locs) ->
          let ConstructorClash (ty1, ty2) | ArityClash (ty1, ty2, _, _) | CircularType (ty1, ty2) = terr in
          let err_locs' =
            let filter_to_loc = function
              | ExtLocation.Source loc -> Some (loc_string loc)
              | _ -> None in
            ExtLocationSet.elements err_locs |>
            List.filter_map ~f:filter_to_loc in
          fprintf ppf "new Clash('<span>%a</span>', %s, %s, [%a])"
            (escape_char '\'' (print_type_error_desc ~w)) terr
            (loc_string_for_ty ty1)
            (loc_string_for_ty ty2)
            (List.print pp_print_string ", ") err_locs'
      | _ ->
          fprintf ppf "new LocalError('%a', %s)"
            (escape_char '\'' EzyErrors.print_error_desc) err
            (loc_string loc)

let print_heavy ppf : (Location.t * heavy_error) -> unit = function
  | _, Error_as_heavy (loc, error) ->
      print_error ppf (loc, error)
  | loc, heavy ->
      pp_set_margin ppf (pp_get_max_indent ppf ());
      fprintf ppf "new LocalError('%a', %s)"
        (escape_char '\'' EzyErrors.print_heavy_error_desc) heavy
        (loc_string loc)

let print_fatal ppf (loc, fatal) =
  pp_set_margin ppf (pp_get_max_indent ppf ());
  fprintf ppf "new LocalError('%a', %s)"
    (escape_char '\'' EzyErrors.print_fatal_error_desc) fatal
    (loc_string loc)
  
let pp_print_html_safe_char ppf c =
  pp_print_string ppf begin
    match c with
      | ' ' -> "&nbsp;"
      | '&' -> "&amp;"
      | '>' -> "&gt;"
      | '<' -> "&lt;"
      | '\n' -> "<br />"
      | _ -> String.make 1 c
  end

exception Found of Location.t
let name_string = "'codeitem'"
let print_program locs ppf code =

  let find_open_locs i =
    let fitting = LocationSet.filter (fun loc -> loc.Location.loc_start.Lexing.pos_cnum = i) locs in
    let compare loc1 loc2 =
      loc2.Location.loc_end.Lexing.pos_cnum - loc1.Location.loc_end.Lexing.pos_cnum in
    List.sort compare (LocationSet.elements fitting) in

  let count_closing_locs i =
    let fitting = LocationSet.filter (fun loc -> loc.Location.loc_end.Lexing.pos_cnum = i) locs in
    LocationSet.cardinal fitting in

  let print_open_tag ppf loc =
    fprintf ppf "<span name=%s id=%s>" name_string (loc_string loc) in

  for i = 0 to String.length code - 1 do
    for i = 1 to count_closing_locs i do
      pp_print_string ppf "</span>" 
    done ;
    List.iter (print_open_tag ppf) (find_open_locs i) ;
    pp_print_html_safe_char ppf code.[i]
  done

let name = "Html error reporting"

let print_program_aux ppf (ast, program) =
  print_program (EzyAst.CollectLocs.structure ast) ppf (Lazy.force program)

let print_errors' ~program ast ppf errors =
  fprintf ppf (template ())
    print_program_aux (ast, program)
    (List.print  (dont_newline print_error) ", ") (ErrorSet.elements errors)

let print_heavies' ~program ast ppf heavies =
  fprintf ppf (template ())
    print_program_aux (ast, program)
    (List.print  (dont_newline print_heavy) ", ") (HeavyErrorSet.elements heavies)

let print_fatal' ~program loc ppf fatal =
  fprintf ppf (template ())
    (print_program (LocationSet.singleton loc)) (Lazy.force program)
    (dont_newline print_fatal) (loc, fatal)

let print_valid ~program ted_str ppf =
  let print_program ppf =
    String.iter (pp_print_html_safe_char ppf) (Lazy.force program) in
  fprintf ppf "<h3>Great! This is a well typed program!</h3>@,<code>%t</code><br />@." print_program

let () = EzyErrors.register name ~print_valid print_errors' print_heavies' print_fatal'
