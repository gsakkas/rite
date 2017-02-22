(* More code regarding construction of parsing errors is in module Failed. *)

(* Easily access constructors for ParseError.t's constituents *)
module C = Sig.Grammar.ParseErrorTs;

module Make (Loc: Sig.Loc) (SpecificError: Sig.TypeWithToString) = struct

  module Loc = Loc;

  module SymbolDesc = struct
    type t = Sig.Grammar.ParseErrorTs.symbol_desc;
    value to_string = 
      fun
      [ C.Entry (name, None) -> "[" ^ name ^ "]"
      | C.Entry (name, Some level) -> "[" ^ name ^ " level " ^ level ^ "]"
      | C.Token descr -> descr
      | C.Keyword kwd -> "\"" ^ kwd ^ "\""
      | C.Unknown -> "???" ];
  end;

  module Expected = struct
    type t = Sig.Grammar.ParseErrorTs.expected;
    value rec to_string = fun
      [ C.Symbol s -> SymbolDesc.to_string s
      | C.Or_list exps -> String.concat " or " (List.map to_string exps)
      | C.Then_list strs -> String.concat " then " strs ];
  end;

  module SpecificError = SpecificError;

  type error = 
    [ Expected of Expected.t and option SymbolDesc.t and string
    | Illegal_begin of SymbolDesc.t
    | Failed
    | Specific_error of SpecificError.t ];

  type t = (Loc.t * error);
  exception E of t;

  value error_to_string = fun
    [ Expected (exp, None, context) ->
        Expected.to_string exp ^ " expected (in [" ^ context ^ "])"
    | Expected (exp, Some sd, context) ->
        Expected.to_string exp ^ " expected after " ^ SymbolDesc.to_string sd ^ " (in [" ^ context ^ "])"
    | Illegal_begin sd ->
        "illegal begin of " ^ SymbolDesc.to_string sd
    | Failed ->
        "failed"
    | Specific_error err ->
        SpecificError.to_string err ];

  value print ppf (loc, error) =
    Format.fprintf ppf "%a: %s" Loc.print loc (error_to_string error);

  value to_string: t -> string =
    fun e ->
      do {
        print Format.str_formatter e ;
        Format.flush_str_formatter ()
      };

  value encode: error -> string =
    fun err ->
      error_to_string err ^ "\000" ^ Marshal.to_string err [];

  value encode_specific : SpecificError.t -> string =
    fun specific ->
      encode (Specific_error specific);

  value raise_stream_error err =
    raise (Stream.Error (encode err));

  value valid_code str = String.contains str '\000';

  value decode code =
    let unmarshal_parse_error : string -> int -> error = Marshal.from_string in
    let i = String.index code '\000' in
    unmarshal_parse_error code (succ i);

end;
