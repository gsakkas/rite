#use "topfind" ;;
#thread ;;
#require "unix,core" ;;
#use "test/loads.ml" ;;      

let dontprintloc ppf (loc: Location.t) = Format.pp_print_string ppf "LOC" ;;

let identprint ppf i = Format.fprintf ppf "I\"%s\"" (Ident.unique_name i) ;;

let envprinter ppf env = 
  Format.pp_print_string ppf "Env[" ;
  List.iter (fun i -> Format.fprintf ppf "%s; " (Ident.name i)) (Env.value_domain env) ;
  Format.pp_print_string ppf "]" ;;


open EzyUtils.Infix
open EzyUtils
open EzyTypingCoreTypes
open EzyConstraints

#install_printer dontprintloc ;;  
#install_printer identprint ;;  
(* #install_printer envprinter ;;   *)
#install_printer EzyTypingCoreTypes.Ty.print ;;  
(*#install_printer EzyTypingCoreTypes.TyVar.print ;; *)
#install_printer EzyTypingCoreTypes.TyVarSubst.print ;; 
#install_printer EzyConstraints.AtConstrSet.print ;;
#install_printer EzyErrors.ErrorSet.print ;;
#install_printer EzyErrors.print_fatal ;;
let ezyenv_print = EzyEnv.print true ;;
#install_printer ezyenv_print ;;
let lid_print ppf lid = Format.fprintf ppf "LID\"%a\"" Longident.print lid ;;
#install_printer lid_print ;;

Config.load_path := ["."; "stdlib"]

let layer = "anfang"
module Log = Logging.Make(struct let layer = layer end)

let _ = Logging.set_layers [
(*  EzyTypingCoreTypes.layer ;*)
(*  EzyConstraints.layer ;*)
(*   EzyEnv.layer ; *)
   EzyGenerate.layer ;   
  EzyTyping.layer ;
(*   layer ; *)
]


module TyPredef = EzyEnv.EzyPredef

let tyvar_of_ty = function
  | Ty.Var tyvar -> tyvar
  | _ -> invalid_arg "tyvar_of_ty"

let ppf = Format.formatter_of_out_channel stdout

let parse_structure text =
  Parser.implementation Lexer.token (Lexing.from_string text)

let parse_expr text =
  match EzyAst.import_structure $ Parser.implementation Lexer.token (Lexing.from_string text) with
    | [ { EzyAst.pstr_desc = EzyAst.Pstr_eval expr } ] -> expr
    | _ -> assert false

let env =
  let sg = Env.read_signature "Pervasives" "stdlib/pervasives.cmi" in
  let initial = Env.add_signature sg (Predef.build_initial_env Env.add_type Env.add_exception Env.empty) in
  List.fold_left (
    function env ->
      function
        | Types.Tsig_value (id, value_desc) -> begin
            try
              ignore (Ty.import true value_desc.Types.val_type) ;
              Env.add_value id value_desc env
            with Invalid_argument "Ty.import" ->
              env
          end
        | _ -> env
  ) initial sg


let print_ast text =
  Printast.implementation 
    (Format.formatter_of_out_channel stdout) 
    (parse_structure text)

let ot text =
  Typemod.type_structure env (parse_structure text)

(*
let ett text =
  let sstr = parse_structure text in
  match EzyAst.import_structure sstr with
    | [{EzyAst.pstr_desc = EzyAst.Pstr_eval expr}]
    | [{EzyAst.pstr_desc = EzyAst.Pstr_value (_, expr)}] ->
        let enr_exp, s = EzyTyping.type_expression env expr in
        TyVarSubst.apply_to_ty s enr_exp.EzyAst.pexp_data.EzyAst.ea_ty, (fun () -> enr_exp, s)
    | _ -> invalid_arg "ett"
 *)

let stt text =
  let str = parse_structure text in
  let estr = EzyAst.import_structure str in
  let enr_str, s, env' = EzyTyping.type_structure env estr in
  Format.printf "Succeeded for\n%awith substitution %a\nand env enriched by %a\n"
    (EzyTyping.print_strs_info s env') enr_str
    TyVarSubst.print s
    (EzyEnv.print ~s false) env' ;
  let tt_str, sg, oenv = Typemod.type_structure env str in
  begin match EzyAst.Equality.eq_structure s enr_str tt_str with
    | None -> Format.printf "Comparision succeeded\n"
    | Some msg -> Format.printf "Comparision failed: %s\n" msg
  end ;
  fun () -> enr_str, s, env'

(*
let t text =

  let expr = 
    let ast = Parser.implementation Lexer.token (Lexing.from_string text) in
    match EzyAst.import_structure ast with
      | [ { EzyAst.pstr_desc = EzyAst.Pstr_eval expr } ] -> expr
      | _ -> assert false in

  let easy_env = EzyEnv.import env in
  let ext_expr, cs, pp = EzyGenerate.for_expr expr easy_env in

  if UnboundVars.is_empty pp.EzyGenerate.PostProcess.unbound_vars then begin
    let s = EzyTyping.solve easy_env 5.0 cs in
    let ty = TyVarSubst.apply s ext_expr.EzyAst.pexp_data.EzyAst.ea_tyvar in
    Log.info "SUCCESS: type %a@." Ty.print ty;
    Some s
  end

  else begin
    Format.fprintf ppf "ERROR UNBOUND VARIABLES:@." ;
    let printer (varname, loc) =
      Format.fprintf ppf "%s@%a"
        (String.concat "." (Longident.flatten varname))
        Printast.fmt_location loc in
    UnboundVars.iter printer pp.EzyGenerate.PostProcess.unbound_vars ;
    None
  end

let ht text = 
  let module Pt = EzyAst in
  let sstr = parse_structure text in
  match Pt.import_structure sstr with
    | [{Pt.pstr_desc = Pt.Pstr_eval expr}]
    | [{Pt.pstr_desc = Pt.Pstr_value (_, expr)}] ->
        let enr_expr, cs, pp = EzyGenerate.for_expr expr (EzyEnv.import env) in
        let us = pp.EzyGenerate.PostProcess.unbound_vars in
        if not (UnboundVars.is_empty us)
        then failwith (format_str "Unknown vars %a" UnboundVars.print us) ;
        let s = EzyTyping.solve enr_expr.Pt.pexp_data.Pt.ea_env 5.0 cs in
        Log.info "Success with e: %a@.Type: %a" TyVarSubst.print s Ty.print (TyVarSubst.apply s enr_expr.Pt.pexp_data.Pt.ea_tyvar) ;
        enr_expr, cs, s
    | _ -> invalid_arg "ht"

let et text =
  let sstr = parse_structure text in
  match EzyAst.import_structure sstr with
    | [{EzyAst.pstr_desc = EzyAst.Pstr_eval expr}]
    | [{EzyAst.pstr_desc = EzyAst.Pstr_value (_, expr)}] ->
        let enr_exp, s = EzyTyping.type_expression env expr in
        TyVarSubst.apply s enr_exp.EzyAst.pexp_data.EzyAst.ea_tyvar, enr_exp, s
    | _ -> invalid_arg "et"
 *)
let env' =
  let sg = Env.read_signature "Pervasives" "stdlib/pervasives.cmi" in
  Env.add_signature sg (Predef.build_initial_env Env.add_type Env.add_exception Env.empty)

let ot text =
  Typemod.type_structure env'
    (parse_structure text)


let alpha = Ty.fresh_var () 
let beta = Ty.fresh_var () 


let _ = print_endline ":         ANFANG          :"
