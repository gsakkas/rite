open EzyOcamlmodules
open EzyUtils
open EzyUtils.Infix
open EzyAst
open EzyAsttypes
open EzyTypingCoreTypes
open EzyConstraints

let logger = new Logger.logger "typing"

module ExtLocationSetDepthSet =
  Set.Make(struct 
    type t = ExtLocationSet.t * int 
    type printable = t
    let print ppf _ = assert false
    let compare (locs, n) (locs', n') =
      match n' - n with
          0 -> ExtLocationSet.compare locs locs'
        | n -> n
  end)



(******************************************************************************)
(*                                UNIFICATION                                 *)
(******************************************************************************)

let rec unify: EzyEnv.t -> AtConstrSet.t -> (DerEnv.t, EzyErrors.type_error * ExtLocationSet.t * ExtLocation.t) Result.t =
  fun env cs ->
    logger#debug "@[<2>Unifying@ %a@]" AtConstrSet.print cs ;
    unify2 env cs DerEnv.empty

and unify2 env cs e =
  unify_full env cs e ConstrSet.empty ExtLocation.none

and unify_full env cs e ds l =
  logger#trace "unify_full %a; %a; %a; %a" AtConstrSet.print cs DerEnv.print e ConstrSet.print ds ExtLocation.print l ;

  let occurs =
    let rec occurs_aux e locs a ty n =
      match ty with
        | Ty.Var (_, _, a') -> 
            begin match DerEnv.lookup e a' with
              | Some (ty, locs') ->
                  occurs_aux e (ExtLocationSet.union locs locs') a ty n
              | None ->
                  if TyVar.compare a a' = 0 then
                    ExtLocationSetDepthSet.singleton (locs, n)
                  else
                    ExtLocationSetDepthSet.empty
            end
        | Ty.Constr (_, _, tys) | Ty.Tuple (_, tys) ->
            ExtLocationSetDepthSet.big_union
              (List.map (occurs_aux e locs a // (succ n)) tys)
        | Ty.Arrow (_, ty1, ty2) -> 
            ExtLocationSetDepthSet.union
              (occurs_aux e locs a ty1 (succ n))
              (occurs_aux e locs a ty2 (succ n)) in
    occurs_aux in

  match ConstrSet.splint ds with
    | None ->
        begin match AtConstrSet.choose_location cs with
          | None -> Result.Ok e
          | Some l ->
              let cs_l, cs_not_l = AtConstrSet.partition_by_location cs l in
              unify_full env cs_not_l e (ConstrSet.from_at_constr_set cs_l) l
        end
    | Some ({ Constr.locs = locs; tys = (tx, ty) }, ds_rest) ->
        let tx' = EzyEnv.full_expand_type env tx in
        let ty' = EzyEnv.full_expand_type env ty in

        if Ty.compare tx' ty' = 0 then begin
          logger#debug "Ignore identity: %a = %a" Ty.print tx' Ty.print ty' ;
          unify_full env cs e ds_rest l
        end else begin
          match tx', ty' with

            (* Incompatibles *)
            | Ty.Arrow _, (Ty.Tuple _ | Ty.Constr _) 
            | (Ty.Tuple _ | Ty.Constr _), Ty.Arrow _
            | Ty.Tuple _, Ty.Constr _ 
            | Ty.Constr _, Ty.Tuple _ ->
                logger#debug "Error %a (%a) vs %a (%a)" Ty.print tx Ty.print tx' Ty.print ty Ty.print ty' ;
                Result.Error (EzyErrors.ConstructorClash (tx', ty'), locs, l) (* FIXME return tx/ty applied ty e *)

            (* X, a *)
            | (Ty.Constr _ | Ty.Arrow _ | Ty.Tuple _), Ty.Var _ -> 
                let c = Constr.create ty locs tx in
                logger#debug "switching X, var: %a" Constr.print c ;
                unify_full env cs e (ConstrSet.add ds_rest c) l

            (* ->, -> *)
            | Ty.Arrow (_, tx1, ty1), Ty.Arrow (_, tx2, ty2) ->
                let cx = Constr.create tx1 locs tx2 in
                let cy = Constr.create ty1 locs ty2 in
                let new_ds = List.fold_left ConstrSet.add ds_rest [cx; cy] in
                logger#debug "Unifying arrows %a, %a --> %a, %a" Ty.print tx' Ty.print ty' Constr.print cx Constr.print cy ;
                unify_full env cs e new_ds l

            (* (...), (...) *)
            | Ty.Tuple (_, tys1), Ty.Tuple (_, tys2) ->
                begin try
                  let aux ds_rest ty1 ty2 =
                    ConstrSet.add ds_rest (Constr.create ty1 locs ty2) in
                  let new_ds = List.fold_left2 aux ConstrSet.empty tys1 tys2 in
                  logger#debug "Tuples %a, %a --> %a" Ty.print tx' Ty.print ty' ConstrSet.print new_ds ;
                  unify_full env cs e (ConstrSet.union ds_rest new_ds) l
                with Invalid_argument "List.fold_left2" ->
                  Result.Error (EzyErrors.ArityClash (tx', ty', List.length tys1, List.length tys2), locs, l)
                end

            (* (a', ...) tx, (b', ...) ty *)
            | Ty.Constr (_, path1, args1), Ty.Constr (_, path2, args2) ->
                let td1 = EzyEnv.find_type path1 env in
                let td2 = EzyEnv.find_type path2 env in
                assert (match td1.EzyEnv.type_kind with EzyEnv.Synonym _ -> false | _ -> true) ;
                assert (match td2.EzyEnv.type_kind with EzyEnv.Synonym _ -> false | _ -> true) ;
                if Path.same path1 path2 && List.length args1 = List.length args2 then (
                  let aux ds ty1 ty2 =
                    ConstrSet.add ds (Constr.create ty1 locs ty2) in
                  let new_ds = List.fold_left2 aux ConstrSet.empty args1 args2 in
                  logger#debug "Ctors %a, %a --> %a" Ty.print tx' Ty.print ty' ConstrSet.print new_ds ;
                  unify_full env cs e (ConstrSet.union ds_rest new_ds) l
                ) else (
                  logger#debug "Cannot unify ctors" ;
                  Result.Error (EzyErrors.ConstructorClash (tx', ty'), locs, l)
                )

            (* a, ty *)
            | Ty.Var (_, _, a), _ ->
                assert (Ty.compare tx ty <> 0) ;
                begin match DerEnv.lookup e a with
                  | Some (ty', locs') ->
                      let all_locs = ExtLocationSet.union locs locs' in
                      let c = Constr.create ty' all_locs ty in
                      logger#debug "TyVar %a, %a: --> %a (lookup)" Ty.print tx' Ty.print ty' Constr.print c ;
                      unify_full env cs e (ConstrSet.add ds_rest c) l
                  | None -> 
                      let locs_depth_set = occurs e locs a ty 0 in
                      if ExtLocationSetDepthSet.is_empty locs_depth_set then (
                        logger#debug "TyVar %a, %a: adding %a -> %a to E" Ty.print tx' Ty.print ty' TyVar.print a Ty.print ty ;
                        unify_full env cs (DerEnv.substitute e a ty locs) ds_rest l
                      ) else
                      let positives = ExtLocationSetDepthSet.filter ((<) 0 << snd) locs_depth_set in
                      if ExtLocationSetDepthSet.is_empty positives then (
                        logger#debug "TyVar %a, %a: all zero, ignore" Ty.print tx' Ty.print ty' ;
                        unify_full env cs e ds_rest l
                      ) else (
                        let locs', _ = ExtLocationSetDepthSet.choose positives in
                        logger#debug "occurring" ;
                        Result.Error (EzyErrors.CircularType (tx', ty'), locs', l)
                      )
                end
        end



(******************************************************************************)
(*                               MINIMIZATION                                 *)
(******************************************************************************)

let rec minimize_full env cs s locs l locs' =
  logger#debug "@[minimize_full@ %a /@ %a /@ %a@]" ExtLocation.print l ExtLocationSet.print locs AtConstrSet.print cs ;
  let cs_l = AtConstrSet.project_by_location cs l in
  let cs_not_l = AtConstrSet.project_by_locations cs (ExtLocationSet.remove l locs) in
  let cs_l' = (* logger#atime "type substitute l" $ *) AtConstrSet.type_substitute cs_l $ s in
  match (* logger#atime "Unify splint" $ *) unify env $ cs_l' with
    | Result.Error (err, _, _) ->
        err, ExtLocationSet.add l locs'
    | Result.Ok e0 ->
        let s0 = TyVarSubst.compose (DerEnv.to_tyvarsubst e0) s in
        let cs_not_l' = (* logger#atime "type substitute non l" $ *) AtConstrSet.type_substitute cs_not_l $ s0 in
        begin match (* logger#atime "Unify non splint" *) unify env $ cs_not_l' with
          | Result.Error (_, locs0, l0) ->
              minimize_full env cs s0 locs0 l0 (ExtLocationSet.add l locs')
          | Result.Ok _ ->
              assert false
        end

let minimize env cs locs l =
  minimize_full env cs TyVarSubst.empty locs l $ ExtLocationSet.empty


(******************************************************************************)
(*                                ENUMERATION                                 *)
(******************************************************************************)

type found_errors = (EzyErrors.type_error * ExtLocationSet.t) list
type enum_state = 
  | Enum_intermediate of AtConstrSet.t * found_errors * ExtLocationSetSet.t
  | Enum_min_errors of found_errors

let insert_error err locs (found:found_errors) =
  let subset_of_locs (_, locs') = ExtLocationSet.subset locs' locs in
  if List.exists subset_of_locs found then
    found
  else
    let not_locs_superset (_, locs') = not (ExtLocationSet.subset locs locs') in
    (err, locs) :: List.filter not_locs_superset found

let insert_todos locss todo =
  let all_todos_not_subset locs =
    let not_subset locs' =
      not (ExtLocationSet.subset locs' locs) in
    ExtLocationSetSet.for_all not_subset todo in
  let new_todos = ExtLocationSetSet.filter all_todos_not_subset locss in
  ExtLocationSetSet.union todo new_todos

let distribute locs' locs =
  let adder l' sofar = ExtLocationSetSet.add (ExtLocationSet.add l' locs) sofar in
  ExtLocationSet.fold adder locs' ExtLocationSetSet.empty

let enum_step env cs (found: found_errors) todo =
  match ExtLocationSetSet.splint todo with
    | None -> 
        Enum_min_errors found
    | Some (locs, todo) ->
      let other_locs = ExtLocationSet.diff (AtConstrSet.locations cs) locs in
      let cs_other_locs = AtConstrSet.project_by_locations cs other_locs in
      begin match (* logger#atime "Unify decreased" $ *) unify env $ cs_other_locs with
        | Result.Ok _ ->
            Enum_intermediate (cs, found, todo)
        | Result.Error (_, locs', l') ->
            let err, minimal = (* logger#atime "minimize error" $ *) minimize env cs locs' $ l' in  (* FIXME use err from minimization ? *)
            let found1 = (* logger#atime "insert error" $ *) insert_error err minimal $ found in
            let todo1 = (* logger#atime "insert todo" $ *) insert_todos (distribute locs' locs) $ todo in
            Enum_intermediate (cs, found1, todo1)
      end


let enum env max_time cs =
  let end_time = Unix.gettimeofday () +. max_time in
  let rec aux step = function
    | Enum_intermediate (cs, found, todo) ->
        if Unix.gettimeofday () < end_time then
          let next_step = (* logger#atime "Enumerate step" $ *) enum_step env cs found $ todo in
          aux (succ step) next_step
        else begin
          logger#info "Enumeration timeout." ;
          found 
        end
    | Enum_min_errors found ->
        assert (found <> []) ;
        found in
  aux 0 (Enum_intermediate (cs, [], ExtLocationSetSet.singleton ExtLocationSet.empty))



(******************************************************************************)
(*                               SOLVE & TYPE                                 *)
(******************************************************************************)

let timeout = try float_of_string (Sys.getenv "EASYOCAML_ENUM_TIMEOUT") with _ -> 3.0

let solve env max_time cs pp ast: (TyVarSubst.t * EzyErrors.ErrorSet.t, EzyErrors.ErrorSet.t) Result.t =
  let module Pp = EzyGenerate.PostProcess in
  match (* logger#atime "Initial unify" $ *) unify env $ cs with
    | Result.Ok e ->
        logger#info "Constraints unified successfully." ;
        let s = (* logger#atime "precede_to_tyvarsubst" $ *)
          DerEnv.precede_to_tyvarsubst e $ TyVarSubst.empty in
        logger#debug "@[<2>Resulting tyvarsubst:@ %a@]" TyVarSubst.print s ;
        let errs = 
          let ta_errs = Pp.TypeAnnotations.valid env s pp.Pp.type_annotations in
          logger#info "checked annotations" ;
          EzyErrors.ErrorSet.union pp.Pp.errors ta_errs in
        Result.Ok (s, errs)
    | Result.Error (_, locss, _) ->
        logger#info "Constraints not unified." ;
        let ta_errs = Pp.TypeAnnotations.valid env TyVarSubst.empty pp.Pp.type_annotations in
        let errs =
          let type_errors = (* logger#atime "Enumerate errors" $ *) enum env max_time $ cs in
          EzyErrors.ErrorSet.union
            (EzyErrors.ErrorSet.from_list (List.map (fun (err, locs) -> (Location.none, EzyErrors.Type_error (err, locs))) type_errors))
            (EzyErrors.ErrorSet.union pp.Pp.errors ta_errs) in
        Result.Error errs

let type_expression env program (expr: EzyAst.imported_expression) ast =
  let env' = EzyEnv.import env in
  let enr_exp, cs, pp = EzyGenerate.for_expr expr env' in
    logger#time 1 "Generated" ;
    logger#info "@[<2>%d constraints generated,@ root: %a." (AtConstrSet.cardinal cs) Ty.print enr_exp.EzyAst.pexp_data.EzyEnrichedAst.ea_ty ;
    match solve env' timeout cs pp ast with
      | Result.Ok (s, errs) when EzyErrors.ErrorSet.is_empty errs ->
          enr_exp, s
      | Result.Error errs | Result.Ok (_, errs) ->
          EzyErrors.raise_annotated_error (EzyErrors.Errors errs) [{ EzyAst.pstr_desc = EzyAst.Pstr_eval expr; pstr_loc = Location.none }]
            
let rec print_strs_info s env ppf = function
  | [] -> ()
  | { EzyAst.pstr_desc = EzyAst.Pstr_eval expr } :: rem ->
      let ty = TyVarSubst.apply_to_ty s (EzyGenerate.ty_of_expr expr) in
      Format.fprintf ppf "@[%a: %a@] " (EzyAst.print_expr ()) expr Ty.print ty ;
      print_strs_info s env ppf rem
  | { EzyAst.pstr_desc = EzyAst.Pstr_rec_value bindings } :: rem ->
      let pp (var, _) =
        let vd = EzyEnv.find_value (Path.Pident var.EzyAst.nm_data) env in
        let ty' = TyVarSubst.apply_to_ty s vd.EzyEnv.val_ty in
        Format.fprintf ppf "@[val %s: %a@] " var.EzyAst.nm_name Ty.print ty' in
      List.iter pp bindings ;
      print_strs_info s env ppf rem
  | { EzyAst.pstr_desc = EzyAst.Pstr_value bindings } :: rem ->
      let pp = function
        | { EzyAst.ppat_desc = EzyAst.Ppat_var var }, _ ->
            let vd = EzyEnv.find_value (Path.Pident var.EzyAst.nm_data) env in
            let ty' = TyVarSubst.apply_to_ty s vd.EzyEnv.val_ty in
            Format.fprintf ppf "@[val %s: %a@] " var.EzyAst.nm_name Ty.print ty'
        | _ -> Format.pp_print_string ppf "<cannot print Pstr_value X>" in
      List.iter pp bindings ;
      print_strs_info s env ppf rem
  | { EzyAst.pstr_desc = EzyAst.Pstr_type tds } :: rem ->
      Format.fprintf ppf "@[type %a@] " (List.print (EzyAst.print_name ()) " and ") (List.map fst tds) ;
      print_strs_info s env ppf rem
  | { EzyAst.pstr_desc = EzyAst.Pstr_open nm } :: rem ->
      Format.fprintf ppf "@[open %a@] " Longident.print nm.lid_name ;
      print_strs_info s env ppf rem
  | _ :: rem ->
      Format.fprintf ppf "@[EzyTyping.print_strs_info cannot print@] " ;
      print_strs_info s env ppf rem

let type_structure ?program (oenv: Env.t) (sstr: EzyAst.imported_structure) (parsetree : Parsetree.structure)=
  let env = (* logger#atime "Env import" *) EzyEnv.import oenv in
  (* logger#debug "@[<2>Type structure in env:@ %a@]" (EzyEnv.print true) env ; *)
  let enr_str, cs, pp, env' =
    (* logger#atime "Generate constraints" $ *) EzyGenerate.for_structure sstr parsetree env oenv in
  enr_str, env'
  (* generate constraints only: no need to solve them *)
  (* if not (EzyErrors.HeavyErrorSet.is_empty pp.EzyGenerate.PostProcess.heavies) then begin
    let heavies = EzyErrors.HeavyErrorSet.add_errors pp.EzyGenerate.PostProcess.errors pp.EzyGenerate.PostProcess.heavies in
    EzyErrors.raise_annotated_error (EzyErrors.Heavies heavies) sstr
  end else () ;
  let res = solve env' timeout cs pp sstr in
  logger#info "Constraints solved" ;
  match res with
    | Result.Ok (s, errs) when EzyErrors.ErrorSet.is_empty errs ->
        enr_str, s, env'
    | Result.Error errs | Result.Ok (_, errs) ->
        EzyErrors.raise_annotated_error (EzyErrors.Errors errs) sstr
  *)

(* For compilation *)
(* Typing of an implementation, i.e. a `.ml' file *)                                     
(* string -> string -> string -> Env.t -> Parsetree.structure ->
                               Typedtree.structure * Typedtree.module_coercion *)
let type_implementation : 
    string -> Env.t -> imported_structure -> Parsetree.structure -> (EzyEnrichedAst.generated_structure * EzyEnv.t) =
  fun sourcefile initial_env ast parsetree ->
  let program = lazy begin
    let ic = open_in sourcefile in
    between input_all ic (fun _ -> close_in ic)
  end in
  let enr_str, env as res = type_structure ~program initial_env ast parsetree in
  (* let check_polymorphy strit =
    let aux (loc, v) =
      let vd = EzyEnv.find_value (Path.Pident v.nm_data) env in
        if vd.EzyEnv.val_binding = EzyEnv.Mono then begin
          let ty = TyVarSubst.apply_to_ty s vd.EzyEnv.val_ty in
            if not (TyVarSet.is_empty (Ty.free_vars ty)) then
              let heavies = EzyErrors.HeavyErrorSet.singleton (loc, EzyErrors.Type_variables_not_generalized (v.nm_name, ty)) in
              EzyErrors.raise_annotated_error (EzyErrors.Heavies heavies) ast
        end in
    match strit.EzyAst.pstr_desc with
      | EzyAst.Pstr_rec_value bindings ->
          List.iter (fun (v, _) -> aux (strit.EzyAst.pstr_loc, v)) bindings
      | EzyAst.Pstr_value bindings ->
          List.iter (fun (p, _) -> List.iter aux (variables_in_pattern p)) bindings
      | _ -> () in
  List.iter check_polymorphy enr_str ;
  logger#info "checked polymorphy" ;
  logger#info "Succeeded typing implementation@ %awith substitution@ %a@ and env enriched by@ %a"
    (print_strs_info s env) enr_str
    TyVarSubst.print s
    (EzyEnv.print ~s false) env ; *)
  res


(*
let type_implementation sourcefile initial_env ast =
  logger#atime "Type implementation" $
    type_implementation sourcefile initial_env $ ast
 *)

let alpha_error msg =
  (* logger#error "@[EasyOcaml did not type well:@ %s@]" msg ; *)
  exit 100 (* NOTE this exit value is recognized by the `runtests' script *)

let beta_error loc p err =
  (* logger#error "@[Douh, EasyCaml missed an error!:@ Location: %a@ %a@]"
   * Location.print loc p err ; *)
  exit 101 (* NOTE this exit value is recognized by the `runtests' script *)

let type_and_compare_implementation sourcefile outputprefix modulename initial_env parse_tree fs =
  logger#debug "Conf.load_path: [%a]" (EzyUtils.List.print Format.pp_print_string ", ") (!Config.load_path);
  (* let enr_str, _ = *)
    let str = EzyEnrichedAst.import_structure fs parse_tree in
    logger#debug "@[<2>Ezy imported tree:@ %a@]" (fun ppf -> List.iter (EzyAst.print_structure_item () ppf)) str ;
    begin try
      let tt, mc = Typemod.type_implementation sourcefile outputprefix modulename initial_env parse_tree in
      (* begin match EzyEnrichedAst.eq_structure s enr_str tt with
        | Some msg -> alpha_error msg
        | None -> ()
      end ; *)
      (tt, mc)
    with
    | Typemod.Error (loc, err) ->
        (* Location.print Format.std_formatter loc; Typemod.report_error Format.std_formatter err; *)
        exit 101
    | Typecore.Error (loc, err) ->
        (* Location.Original.print Format.std_formatter loc; 
        Format.fprintf Format.std_formatter "%a@\n" Typecore.report_error err; *)
        type_implementation sourcefile initial_env str parse_tree; exit 101

    (*    beta_error loc Typecore.report_error err *)
    (* let ted_str = EzyEnrichedAst.apply_substitution s enr_str in *)

  end 


let type_and_compare_top_phrase fs oldenv str =
  logger#debug "Conf.load_path: [%a]" (EzyUtils.List.print Format.pp_print_string ", ") (!Config.load_path);
  (* no need to compare the results. Feed the str to ocaml type inference
   * to identify typing errors *)
  (* let ted_str = EzyEnrichedAst.apply_substitution s enr_str in *)
  begin try
    Typecore.reset_delayed_checks ();
    let (str, sg, newenv) = Typemod.type_structure oldenv str in
    Typecore.force_delayed_checks ();
    (* begin match EzyEnrichedAst.eq_structure s enr_str str with
      | Some msg -> alpha_error msg
      | None -> ()
    end ; *)
    (str, sg, newenv)
  with
    | Typemod.Error (loc, err) ->
        (* Location.print Format.std_formatter loc; Typemod.report_error Format.std_formatter err; *)
        exit 101
    | Typecore.Error (loc, err) ->
        (* Location.Original.print Format.std_formatter loc; 
        Format.fprintf Format.std_formatter "%a@\n" Typecore.report_error err; *)
        let str' = EzyEnrichedAst.import_structure fs str in type_structure oldenv str' str; exit 101
  end
