(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*            Xavier Leroy, projet Cristal, INRIA Rocquencourt         *)
(*                                                                     *)
(*  Copyright 1996 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: matching.ml,v 1.67.12.1 2007/06/08 08:03:16 garrigue Exp $ *)

(* Compilation of pattern matching *)

open Misc
open Asttypes
open Primitive
open Types
open Typedtree
open Lambda
open Parmatch
open Printf

(*  See Peyton-Jones, ``The Implementation of functional programming
    languages'', chapter 5. *)
(*
  Bon, au commencement du monde c'etait vrai.
  Now, see Lefessant-Maranget ``Optimizing Pattern-Matching'' ICFP'2001
*)


(*
   Many functions on the various data structures ofthe algorithm :
     - Pattern matrices.
     - Default environments: mapping from matrices to exit numbers.
     - Contexts:  matrices whose column are partitioned into
       left and right.
     - Jump sumaries: mapping from exit numbers to contexts
*)

type matrix = pattern list list

let add_omega_column pss = List.map (fun ps -> omega::ps) pss

type ctx = {left:pattern list ; right:pattern list}

let pretty_ctx ctx =
  List.iter
    (fun {left=left ; right=right} ->
      prerr_string "LEFT:" ;
      pretty_line left ;
      prerr_string " RIGHT:" ;
      pretty_line right ;
      prerr_endline "")
    ctx

let le_ctx c1 c2 =
  le_pats c1.left c2.left &&
  le_pats c1.right c2.right
  
let lshift {left=left ; right=right} = match right with
| x::xs -> {left=x::left ; right=xs}
| _ ->  assert false

let lforget {left=left ; right=right} = match right with
| x::xs -> {left=omega::left ; right=xs}
|  _ -> assert false

let rec small_enough n = function
  | [] -> true
  | _::rem ->
      if n <= 0 then false
      else small_enough (n-1) rem

let ctx_lshift ctx =
  if small_enough 31 ctx then
    List.map lshift ctx
  else (* Context pruning *) begin      
    get_mins le_ctx (List.map lforget ctx)
  end

let  rshift {left=left ; right=right} = match left with
| p::ps -> {left=ps ; right=p::right}
| _ -> assert false

let ctx_rshift ctx = List.map rshift ctx

let rec nchars n ps =
  if n <= 0 then [],ps
  else match ps with
  | p::rem ->
    let chars, cdrs = nchars (n-1) rem in
    p::chars,cdrs
  | _ -> assert false
      
let  rshift_num n {left=left ; right=right} =
  let shifted,left = nchars n left in
  {left=left ; right = shifted@right}

let ctx_rshift_num n ctx = List.map (rshift_num n) ctx

(* Recombination of contexts (eg: (_,_)::p1::p2::rem ->  (p1,p2)::rem)
  All mutable fields are replaced by '_', since side-effects in
  guards can alter these fields *)

let combine {left=left ; right=right} = match left with
| p::ps -> {left=ps ; right=set_args_erase_mutable p right}
| _ -> assert false

let ctx_combine ctx = List.map combine ctx

let ncols = function
  | [] -> 0
  | ps::_ -> List.length ps


exception NoMatch
exception OrPat

let filter_matrix matcher pss =

  let rec filter_rec = function
    | (p::ps)::rem ->
        begin match p.pat_desc with
        | Tpat_alias (p,_) ->
            filter_rec ((p::ps)::rem)
        | Tpat_var _ ->
            filter_rec ((omega::ps)::rem)
        | _ ->
            begin
              let rem = filter_rec rem in
              try
                matcher p ps::rem
              with
              | NoMatch -> rem
              | OrPat   ->
                match p.pat_desc with
                | Tpat_or (p1,p2,_) -> filter_rec [(p1::ps) ;(p2::ps)]@rem
                | _ -> assert false
            end
        end
    | [] -> []
    | _ ->
        pretty_matrix pss ;
        fatal_error "Matching.filter_matrix" in
  filter_rec pss

let make_default matcher env =
  let rec make_rec = function
    | [] -> []
    | ([[]],i)::_ -> [[[]],i]
    | (pss,i)::rem ->
        let rem = make_rec rem in
        match filter_matrix matcher pss with
        | [] -> rem
        | ([]::_) -> ([[]],i)::rem
        | pss -> (pss,i)::rem in
  make_rec env

let ctx_matcher p =
  let p = normalize_pat p in
  match p.pat_desc with
  | Tpat_construct (cstr,omegas) ->
      (fun q rem -> match q.pat_desc with
      | Tpat_construct (cstr',args) when cstr.cstr_tag=cstr'.cstr_tag ->
          p,args @ rem
      | Tpat_any -> p,omegas @ rem
      | _ -> raise NoMatch)
  | Tpat_constant cst ->
      (fun q rem -> match q.pat_desc with
      | Tpat_constant cst' when cst=cst' ->
          p,rem
      | Tpat_any -> p,rem
      | _ -> raise NoMatch)
  | Tpat_variant (lab,Some omega,_) ->
      (fun q rem -> match q.pat_desc with
      | Tpat_variant (lab',Some arg,_) when lab=lab' ->
          p,arg::rem
      | Tpat_any -> p,omega::rem
      | _ -> raise NoMatch)
  | Tpat_variant (lab,None,_) ->
      (fun q rem -> match q.pat_desc with
      | Tpat_variant (lab',None,_) when lab=lab' ->
          p,rem
      | Tpat_any -> p,rem
      | _ -> raise NoMatch)
  | Tpat_array omegas ->
      let len = List.length omegas in
      (fun q rem -> match q.pat_desc with
      | Tpat_array args when List.length args=len ->
          p,args @ rem
      | Tpat_any -> p, omegas @ rem
      | _ -> raise NoMatch)
  | Tpat_tuple omegas ->
      (fun q rem -> match q.pat_desc with
      | Tpat_tuple args -> p,args @ rem
      | _          -> p, omegas @ rem)
  | Tpat_record l -> (* Records are normalized *)
      (fun q rem -> match q.pat_desc with
      | Tpat_record l' ->
          let l' = all_record_args l' in
          p, List.fold_right (fun (_,p) r -> p::r) l' rem
      | _ -> p,List.fold_right (fun (_,p) r -> p::r) l rem)
  | _ -> fatal_error "Matching.ctx_matcher"




let filter_ctx q ctx =

  let matcher = ctx_matcher q in

  let rec filter_rec = function
    | ({right=p::ps} as l)::rem ->
        begin match p.pat_desc with
        | Tpat_or (p1,p2,_) ->
            filter_rec ({l with right=p1::ps}::{l with right=p2::ps}::rem)
        | Tpat_alias (p,_) ->
            filter_rec ({l with right=p::ps}::rem)
        | Tpat_var _ ->
            filter_rec ({l with right=omega::ps}::rem)
        | _ ->
            begin let rem = filter_rec rem in
            try
              let to_left, right = matcher p ps in
              {left=to_left::l.left ; right=right}::rem
            with
            | NoMatch -> rem
            end
        end
    | [] -> []
    | _ ->  fatal_error "Matching.filter_ctx" in

  filter_rec ctx

let select_columns pss ctx =
  let n = ncols pss in
  List.fold_right
    (fun ps r ->
      List.fold_right
        (fun {left=left ; right=right} r ->
          let transfert, right = nchars n right in
          try
            {left = lubs transfert ps @ left ; right=right}::r
          with
          | Empty -> r)
        ctx r)
    pss []

let ctx_lub p ctx =
  List.fold_right
    (fun {left=left ; right=right} r ->
      match right with
      | q::rem ->
          begin try
            {left=left ; right = lub p q::rem}::r
          with
          | Empty -> r
          end
      | _ -> fatal_error "Matching.ctx_lub")
    ctx []

let ctx_match ctx pss =
  List.exists
    (fun {right=qs} ->
      List.exists
        (fun ps -> compats qs ps)
        pss)
    ctx

type jumps = (int * ctx ) list

let pretty_jumps env = match env with
| [] -> ()
| _ ->
    List.iter
      (fun (i,ctx) ->
        Printf.fprintf stderr "jump for %d\n" i ;
        pretty_ctx ctx)
      env


let rec jumps_extract i = function
  | [] -> [],[]
  | (j,pss) as x::rem as all ->
      if i=j then pss,rem
      else if j < i then [],all
      else
        let r,rem = jumps_extract i rem in
        r,(x::rem)

let rec jumps_remove i = function
  | [] -> []
  | (j,_)::rem when i=j -> rem
  | x::rem -> x::jumps_remove i rem 

let jumps_empty = []
and jumps_is_empty = function
  |  [] -> true
  |  _ -> false

let jumps_singleton i = function
  | []  -> []
  | ctx ->  [i,ctx]

let jumps_add i pss jumps = match pss with
| [] -> jumps
| _  ->
    let rec add = function
      | [] -> [i,pss]
      | (j,qss) as x::rem as all ->
          if j > i then x::add rem
      else if j < i then (i,pss)::all
      else (i,(get_mins le_ctx (pss@qss)))::rem in
    add jumps


let rec jumps_union env1 env2 = match env1,env2 with
| [],_ -> env2
| _,[] -> env1
| ((i1,pss1) as x1::rem1), ((i2,pss2) as x2::rem2) ->
    if i1=i2 then
      (i1,get_mins le_ctx (pss1@pss2))::jumps_union rem1 rem2
    else if i1 > i2 then
      x1::jumps_union rem1 env2
    else
      x2::jumps_union env1 rem2


let rec merge = function
  | env1::env2::rem ->  jumps_union env1 env2::merge rem
  | envs -> envs

let rec jumps_unions envs = match envs with
  | [] -> []
  | [env] -> env
  | _ -> jumps_unions (merge envs)

let rec jumps_map f env =
  List.map
    (fun (i,pss) -> i,f pss)
    env

(* Pattern matching before any compilation *)

type pattern_matching =
  { mutable cases : (pattern list * lambda) list;
    args : (lambda * let_kind) list ;
    default : (matrix * int) list}

(* Pattern matching after application of both the or-pat rule and the
   mixture rule *)

type pm_or_compiled =
  {body : pattern_matching ;
   handlers : (matrix * int * Ident.t list * pattern_matching) list ;
   or_matrix : matrix ; }

type pm_half_compiled =
  | PmOr of pm_or_compiled 
  | PmVar of pm_var_compiled
  | Pm of pattern_matching

and pm_var_compiled =
    {inside : pm_half_compiled ; var_arg : lambda ; }

type pm_half_compiled_info =
    {me : pm_half_compiled ;
     matrix : matrix ;
     top_default : (matrix * int) list ; }

let pretty_cases cases =
  List.iter
    (fun ((ps),l) ->
      List.iter
        (fun p ->
          Parmatch.top_pretty Format.str_formatter p ;
          prerr_string " " ;
          prerr_string (Format.flush_str_formatter ()))
        ps ;
(*
      prerr_string " -> " ;
      Printlambda.lambda Format.str_formatter l ;
      prerr_string (Format.flush_str_formatter ()) ;
*)
      prerr_endline "")
    cases

let pretty_def def =
  prerr_endline "+++++ Defaults +++++" ;
  List.iter
    (fun (pss,i) ->
      Printf.fprintf stderr "Matrix for %d\n"  i ;
      pretty_matrix pss)
    def ;
  prerr_endline "+++++++++++++++++++++"

let pretty_pm pm = pretty_cases pm.cases


let rec pretty_precompiled = function
  | Pm pm ->
      prerr_endline "++++ PM ++++" ;
      pretty_pm pm
  | PmVar x ->
      prerr_endline "++++ VAR ++++" ;
      pretty_precompiled x.inside
  | PmOr x ->
      prerr_endline "++++ OR ++++" ;
      pretty_pm x.body ;
      List.iter
        (fun (_,i,_,pm) ->
          eprintf "++ Handler %d ++\n" i ;
          pretty_pm pm)
        x.handlers

let pretty_precompiled_res first nexts =
  pretty_precompiled first ;
  List.iter
    (fun (e, pmh) ->
      eprintf "** DEFAULT %d **\n" e ;
      pretty_precompiled pmh)
    nexts



(* A slight attempt to identify semantically equivalent lambda-expressions *)
exception Not_simple

let rec raw_rec env = function
  | Llet(Alias,x,ex, body) -> raw_rec ((x,raw_rec env ex)::env) body
  | Lvar id as l ->
      begin try List.assoc id env with
      | Not_found -> l
      end
  | Lprim (Pfield i,args) ->
      Lprim (Pfield i, List.map (raw_rec env) args)
  | Lconst _ as l -> l
  | Lstaticraise (i,args) ->
        Lstaticraise (i, List.map (raw_rec env) args)
  | _ -> raise Not_simple

let raw_action l = try raw_rec [] l with Not_simple -> l

let same_actions = function
  | [] -> None
  | [_,act] -> Some act
  | (_,act0) :: rem ->
      try
        let raw_act0 = raw_rec [] act0 in
        let rec s_rec = function
          | [] -> Some act0
          | (_,act)::rem ->
              if raw_act0 = raw_rec [] act then
                s_rec rem
              else
                None in
        s_rec rem
      with
      | Not_simple -> None

let equal_action act1 act2 =
  try
    let raw1 = raw_rec [] act1
    and raw2 = raw_rec [] act2 in
    raw1 = raw2
  with
  | Not_simple -> false

(* Test for swapping two clauses *)

let up_ok_action act1 act2 =
  try
    let raw1 = raw_rec [] act1
    and raw2 = raw_rec [] act2 in
    match raw1, raw2 with
    | Lstaticraise (i1,[]), Lstaticraise (i2,[]) -> i1=i2
    | _,_ -> raw1 = raw2
  with
  | Not_simple -> false

let up_ok (ps,act_p) l =
  List.for_all
    (fun (qs,act_q) ->
      up_ok_action act_p act_q ||
      not (Parmatch.compats ps qs))
    l


(*
   Simplify fonction normalize the first column of the match
     - records are expanded so that they posses all fields
     - aliases are removed and replaced by bindings in actions.
   However or-patterns are simplified differently,
     - aliases are not removed
     - or patterns (_|p) are changed into _
*)

exception Var of pattern

let simplify_or p =
  let rec simpl_rec p = match p with
    | {pat_desc = Tpat_any|Tpat_var _} -> raise (Var p)
    | {pat_desc = Tpat_alias (q,id)} -> 
        begin try
          {p with pat_desc = Tpat_alias (simpl_rec q,id)}
        with
        | Var q -> raise (Var {p with pat_desc = Tpat_alias (q,id)})
        end
    | {pat_desc = Tpat_or (p1,p2,o)} ->
        let q1 = simpl_rec p1 in
        begin try 
          let q2 = simpl_rec p2 in
          {p with pat_desc = Tpat_or (q1, q2, o)}
        with 
        | Var q2 -> raise (Var {p with pat_desc = Tpat_or (q1, q2, o)})
        end
    | {pat_desc = Tpat_record lbls} ->
        let all_lbls = all_record_args lbls in
        {p with pat_desc=Tpat_record all_lbls}        
    | _ -> p in
  try
    simpl_rec p
  with
  | Var p -> p

let rec simplify_cases args cls = match args with
| [] -> assert false
| (arg,_)::_ ->
    let rec simplify = function
      | [] -> []
      | ((pat :: patl, action) as cl) :: rem ->
          begin match pat.pat_desc with
          | Tpat_var id ->
              (omega :: patl, bind Alias id arg action) ::
              simplify rem
          | Tpat_any ->
              cl :: simplify rem
          | Tpat_alias(p, id) ->
              simplify ((p :: patl, bind Alias id arg action) :: rem)
          | Tpat_record [] ->
              (omega :: patl, action)::
              simplify rem
          | Tpat_record lbls ->
              let all_lbls = all_record_args lbls in
              let full_pat = {pat with pat_desc=Tpat_record all_lbls} in
              (full_pat::patl,action)::
              simplify rem
          | Tpat_or _ ->
              let pat_simple  = simplify_or pat in
              begin match pat_simple.pat_desc with
              | Tpat_or _ ->
                  (pat_simple :: patl, action) ::
                  simplify rem
              | _ ->
                  simplify ((pat_simple::patl,action) :: rem)
              end
          | _ -> cl :: simplify rem
          end
      | _ -> assert false in

    simplify cls



(* Once matchings are simplified one easily finds
   their nature *)

let rec what_is_cases cases = match cases with
| ({pat_desc=Tpat_any} :: _, _) :: rem -> what_is_cases rem
| (({pat_desc=(Tpat_var _|Tpat_or (_,_,_)|Tpat_alias (_,_))}::_),_)::_
  -> assert false (* applies to simplified matchings only *)
| (p::_,_)::_ -> p
| [] -> omega 
| _ -> assert false



(* A few operation on default environments *)
let as_matrix cases = get_mins le_pats (List.map (fun (ps,_) -> ps) cases)

let cons_default matrix raise_num default =
  match matrix with
  | [] -> default
  | _ -> (matrix,raise_num)::default

let default_compat p def =
  List.fold_right
    (fun (pss,i) r ->
      let qss =
        List.fold_right
          (fun qs r -> match qs with
            | q::rem when Parmatch.compat p q -> rem::r
            | _ -> r)
          pss [] in
      match qss with
      | [] -> r
      | _  -> (qss,i)::r)
    def []

(* Or-pattern expansion, variables are a complication w.r.t. the article *)
let rec extract_vars r p = match p.pat_desc with
| Tpat_var id -> IdentSet.add id r
| Tpat_alias (p, id) ->
    extract_vars (IdentSet.add id r) p
| Tpat_tuple pats ->
    List.fold_left extract_vars r pats
| Tpat_record lpats ->
    List.fold_left
      (fun r (_,p) -> extract_vars r p)
      r lpats
| Tpat_construct (_,pats) ->
    List.fold_left extract_vars r pats
| Tpat_array pats ->
    List.fold_left extract_vars r pats
| Tpat_variant (_,Some p, _) -> extract_vars r p
| Tpat_or (p,_,_) -> extract_vars r p
| Tpat_constant _|Tpat_any|Tpat_variant (_,None,_) -> r

exception Cannot_flatten

let mk_alpha_env arg aliases ids =
  List.map
    (fun id -> id,
      if List.mem id aliases then
        match arg with
        | Some v -> v
        | _      -> raise Cannot_flatten
      else 
        Ident.create (Ident.name id))
    ids

let rec explode_or_pat arg patl mk_action rem vars aliases = function
  | {pat_desc = Tpat_or (p1,p2,_)} ->
      explode_or_pat
        arg patl mk_action
        (explode_or_pat arg patl mk_action rem vars aliases p2)
        vars aliases p1
  | {pat_desc = Tpat_alias (p,id)} ->
      explode_or_pat arg patl mk_action rem vars (id::aliases) p
  | {pat_desc = Tpat_var x} ->
      let env = mk_alpha_env arg (x::aliases) vars in      
      (omega::patl,mk_action (List.map snd env))::rem
  | p ->
      let env = mk_alpha_env arg aliases vars in      
      (alpha_pat env p::patl,mk_action (List.map snd env))::rem

let pm_free_variables {cases=cases} =
  List.fold_right
    (fun (_,act) r -> IdentSet.union (free_variables act) r)
    cases IdentSet.empty


(* Basic grouping predicates *)

let group_constant = function
  | {pat_desc= Tpat_constant _} -> true
  | _                           -> false

and group_constructor = function
  | {pat_desc = Tpat_construct (_, _)} -> true
  | _ -> false

and group_variant = function
  | {pat_desc = Tpat_variant (_, _, _)} -> true
  | _ -> false

and group_var = function
  | {pat_desc=Tpat_any} -> true
  | _ -> false

and group_tuple = function
  | {pat_desc = (Tpat_tuple _|Tpat_any)} -> true
  | _ -> false

and group_record = function
  | {pat_desc = (Tpat_record _|Tpat_any)} -> true
  | _ -> false

and group_array = function
  | {pat_desc=Tpat_array _} -> true
  | _ -> false

let get_group p = match p.pat_desc with
| Tpat_any -> group_var
| Tpat_constant _ -> group_constant
| Tpat_construct (_, _) -> group_constructor
| Tpat_tuple _ -> group_tuple
| Tpat_record _ -> group_record
| Tpat_array _ -> group_array
| Tpat_variant (_,_,_) -> group_variant
|  _ -> fatal_error "Matching.get_group"



let is_or p = match p.pat_desc with
| Tpat_or _ -> true
| _ -> false

(* Conditions for appending to the Or matrix *)
let conda p q = not (compat p q)
and condb act ps qs =  not (is_guarded act) && Parmatch.le_pats qs ps

let or_ok p ps l =
  List.for_all
    (function
      | ({pat_desc=Tpat_or _} as q::qs,act) ->
          conda p q || condb act ps qs
      | _ -> true)
    l

(* Insert or append a pattern in the Or matrix *)

let equiv_pat p q = le_pat p q && le_pat q p

let rec get_equiv p l = match l with
  | (q::_,_) as cl::rem ->
      if equiv_pat p q then
        let others,rem = get_equiv p rem in
        cl::others,rem
      else
        [],l
  | _ -> [],l


let insert_or_append p ps act ors no =
  let rec attempt seen = function
    | (q::qs,act_q) as cl::rem ->
        if is_or q then begin
          if compat p q then
            if
              IdentSet.is_empty (extract_vars IdentSet.empty p) &&
              IdentSet.is_empty (extract_vars IdentSet.empty q) &&
              equiv_pat p q
            then (* attempt insert, for equivalent orpats with no variables *)
              let _, not_e = get_equiv q rem in
              if
                or_ok p ps not_e && (* check append condition for head of O *)
                List.for_all        (* check insert condition for tail of O *)
                  (fun cl -> match cl with
                  | (q::_,_) -> not (compat p q)
                  | _        -> assert false)
                  seen
              then (* insert *)
                List.rev_append seen ((p::ps,act)::cl::rem), no
              else (* fail to insert or append *)
                ors,(p::ps,act)::no
            else if condb act_q ps qs then (* check condition (b) for append *)
              attempt (cl::seen) rem 
            else
              ors,(p::ps,act)::no
          else (* p # q, go on with append/insert *)
            attempt (cl::seen) rem
        end else (* q is not a or-pat, go on with append/insert *)
          attempt (cl::seen) rem
    | _  -> (* [] in fact *)
        (p::ps,act)::ors,no in (* success in appending *)
  attempt [] ors

(* Reconstruct default information from half_compiled  pm list *)

let rec rebuild_matrix pmh = match pmh with
  | Pm pm -> as_matrix pm.cases
  | PmOr {or_matrix=m} -> m
  | PmVar x -> add_omega_column  (rebuild_matrix x.inside)

let rec rebuild_default nexts def = match nexts with
| [] -> def
| (e, pmh)::rem ->
    (add_omega_column (rebuild_matrix pmh), e)::
    rebuild_default rem def
  
let rebuild_nexts arg nexts k =
  List.fold_right
    (fun (e, pm) k -> (e, PmVar {inside=pm ; var_arg=arg})::k)
    nexts k


(*
  Split a matching.
    Splitting is first directed by or-patterns, then by
    tests (e.g. constructors)/variable transitions.

    The approach is greedy, every split function attempt to
    raise rows as much as possible in the top matrix,
    then splitting applies again to the remaining rows.

    Some precompilation of or-patterns and
    variable pattern occurs. Mostly this means that bindings
    are performed now,  being replaced by let-bindings
    in actions (cf. simplify_cases).

    Additionally, if the match argument is a variable, matchings whose
    first column is made of variables only are splitted further
    (cf. precompile_var).

*)


let rec split_or argo cls args def =

  let cls = simplify_cases args cls in

  let rec do_split before ors no = function
    | [] ->
        cons_next
          (List.rev before) (List.rev ors) (List.rev no)
    | ((p::ps,act) as cl)::rem ->
        if up_ok cl no then
          if is_or p then
            let ors, no = insert_or_append p ps act ors no in
            do_split before ors no rem
          else begin
            if up_ok cl ors then
              do_split (cl::before) ors no rem
            else if or_ok p ps ors then
              do_split before (cl::ors) no rem
            else
              do_split before ors (cl::no) rem
          end
        else
          do_split before ors (cl::no) rem
    | _ -> assert false

  and cons_next yes yesor = function
    | [] ->
        precompile_or argo yes yesor args def []
    | rem ->
        let {me=next ; matrix=matrix ; top_default=def},nexts =
          do_split [] [] [] rem in
        let idef = next_raise_count () in        
        precompile_or
          argo yes yesor args
          (cons_default matrix idef def)
          ((idef,next)::nexts) in

  do_split [] [] [] cls

and split_constr cls args def k =
  let ex_pat = what_is_cases cls in
  match ex_pat.pat_desc with
  | Tpat_any -> precompile_var args cls def k
  | _ ->

      let group = get_group ex_pat in

      let rec split_ex yes no = function
        | [] ->
            let yes = List.rev yes and no = List.rev no in
            begin match no with
            | [] ->
                {me = Pm {cases=yes ; args=args ; default=def} ;
                  matrix = as_matrix yes ;
                  top_default = def},
                k
            | cl::rem ->
                begin match yes with
                | [] ->
                    (* Could not success in raising up a constr matching up *)
                    split_noex [cl] [] rem            
                | _ ->
                    let {me=next ; matrix=matrix ; top_default=def}, nexts =
                      split_noex [cl] [] rem in                
                    let idef = next_raise_count () in
                    let def = cons_default matrix idef def in
                    {me = Pm {cases=yes ; args=args ; default=def} ;
                      matrix = as_matrix yes ;
                      top_default = def },
                    (idef, next)::nexts
                end
            end
        | (p::_,_) as cl::rem ->
            if group p && up_ok cl no then
              split_ex (cl::yes) no rem
            else
              split_ex yes (cl::no) rem
        | _ -> assert false

      and split_noex yes no = function
        | [] ->
            let yes = List.rev yes and no = List.rev no in
            begin match no with
            | [] -> precompile_var args yes def k
            | cl::rem ->
                let {me=next ; matrix=matrix ; top_default=def}, nexts =
                  split_ex [cl] [] rem in
                let idef = next_raise_count () in
                precompile_var
                  args yes
                  (cons_default matrix idef def)
                  ((idef,next)::nexts)
            end
        | [ps,_ as cl]
            when List.for_all group_var ps && yes <> [] ->
       (* This enables an extra division in some frequent case :
          last row is made of variables only *)
              split_noex yes (cl::no) []
        | (p::_,_) as cl::rem ->
            if not (group p) && up_ok cl no then
              split_noex (cl::yes) no rem
            else
              split_noex yes (cl::no) rem
        | _ -> assert false in

      match cls with
      | ((p::_,_) as cl)::rem ->
          if group p then split_ex [cl] [] rem
          else split_noex [cl] [] rem
      | _ ->  assert false

and precompile_var  args cls def k = match args with
| []  -> assert false
| _::((Lvar v as av,_) as arg)::rargs ->
    begin match cls with
    | [ps,_] -> (* as splitted as it can *)
        dont_precompile_var args cls def k
    | _ ->
(* Precompile *)
        let var_cls =
          List.map
            (fun (ps,act) -> match ps with
            | _::ps -> ps,act | _     -> assert false)
            cls
        and var_def = make_default (fun _ rem -> rem) def in
        let {me=first ; matrix=matrix}, nexts =
          split_or (Some v) var_cls (arg::rargs) var_def in
        
(* Compute top information *)
        match nexts with
        | [] -> (* If you need *)
            dont_precompile_var args cls def k
        | _  ->
            let rfirst =
              {me = PmVar {inside=first ; var_arg = av} ;
                matrix = add_omega_column matrix ;
                top_default = rebuild_default nexts def ; }
            and rnexts = rebuild_nexts av nexts k in
            rfirst, rnexts
    end
|  _ ->
    dont_precompile_var args cls def k

and dont_precompile_var args cls def k =
  {me =  Pm {cases = cls ; args = args ; default = def } ;
    matrix=as_matrix cls ;
    top_default=def},k

and precompile_or argo cls ors args def k = match ors with
| [] -> split_constr cls args def k
| _  ->
    let rec do_cases = function
      | ({pat_desc=Tpat_or _} as orp::patl, action)::rem ->
          let others,rem = get_equiv orp rem in          
          let orpm =
            {cases =
              (patl, action)::
              List.map
                (function
                  | (_::ps,action) -> ps,action
                  | _ -> assert false)
                others ;
              args = (match args with _::r -> r | _ -> assert false) ;
              default = default_compat orp def} in
          let vars =
            IdentSet.elements
              (IdentSet.inter
                 (extract_vars IdentSet.empty orp)
                 (pm_free_variables orpm)) in
          let or_num = next_raise_count () in
          let new_patl = Parmatch.omega_list patl in

          let mk_new_action vs =
            Lstaticraise
              (or_num, List.map (fun v -> Lvar v) vs) in

          let body,handlers = do_cases rem in
          explode_or_pat
            argo new_patl mk_new_action body vars [] orp,
          (([[orp]], or_num, vars , orpm):: handlers)
      | cl::rem ->
          let new_ord,new_to_catch = do_cases rem in
          cl::new_ord,new_to_catch
      | [] -> [],[] in

    let end_body, handlers = do_cases ors in
    let matrix = as_matrix (cls@ors)
    and body = {cases=cls@end_body ; args=args ; default=def} in
    {me = PmOr {body=body ; handlers=handlers ; or_matrix=matrix} ;
      matrix=matrix ;
      top_default=def},
    k

let split_precompile argo pm =
  let {me=next}, nexts = split_or argo pm.cases pm.args pm.default  in
(*
  if nexts <> [] || (match next with PmOr _ -> true | _ -> false) then begin
    prerr_endline "** SPLIT **" ;
    pretty_pm pm ;
    pretty_precompiled_res  next nexts
  end ;
*)
  next, nexts


(* General divide functions *)

let add_line patl_action pm = pm.cases <- patl_action :: pm.cases; pm

type cell =
  {pm : pattern_matching ;
  ctx : ctx list ;
  pat : pattern}

let add make_matching_fun division key patl_action args =
  try
    let cell = List.assoc key division in
    cell.pm.cases <- patl_action :: cell.pm.cases;
    division
  with Not_found ->
    let cell = make_matching_fun args in
    cell.pm.cases <- [patl_action] ;
    (key, cell) :: division

        
let divide make get_key get_args ctx pm =

  let rec divide_rec = function
    | (p::patl,action) :: rem ->
        let this_match = divide_rec rem in
        add
          (make p pm.default ctx)
          this_match (get_key p) (get_args p patl,action) pm.args
    | _ -> [] in

  divide_rec pm.cases


let divide_line make_ctx make get_args pat ctx pm =
  let rec divide_rec = function
    | (p::patl,action) :: rem ->
        let this_match = divide_rec rem in
        add_line (get_args p patl, action) this_match
    | _ -> make pm.default pm.args in

  {pm = divide_rec pm.cases ;
  ctx=make_ctx ctx ;
  pat=pat}



(* Then come various functions,
   There is one set of functions per matching style
   (constants, constructors etc.)

   - matcher function are arguments to make_default (for defaukt handlers)
   They may raise NoMatch or OrPat and perform the full
   matching (selection + arguments).

   
   - get_args and get_key are for the compiled matrices, note that
   selection and geting arguments are separed.

   - make_ _matching combines the previous functions for produicing
   new  ``pattern_matching'' records.
*)



let rec matcher_const cst p rem = match p.pat_desc with
| Tpat_or (p1,p2,_) ->
    begin try
      matcher_const cst p1 rem with
    | NoMatch -> matcher_const cst p2 rem
    end
| Tpat_constant c1 when c1=cst -> rem
| Tpat_any                     -> rem
| _ -> raise NoMatch

let get_key_constant caller = function
  | {pat_desc= Tpat_constant cst} -> cst
  | p ->
      prerr_endline ("BAD: "^caller) ;
      pretty_pat p ;
      assert false

let get_args_constant _ rem = rem

let make_constant_matching p def ctx = function
    [] -> fatal_error "Matching.make_constant_matching"
  | (_ :: argl) ->
      let def =
        make_default
          (matcher_const (get_key_constant "make" p)) def
      and ctx = 
        filter_ctx p  ctx in
      {pm = {cases = []; args = argl ; default = def} ;
        ctx = ctx ;
        pat = normalize_pat p}




let divide_constant ctx m =
  divide
    make_constant_matching (get_key_constant "divide")
    get_args_constant
    ctx m

(* Matching against a constructor *)


let make_field_args binding_kind arg first_pos last_pos argl =
  let rec make_args pos =
    if pos > last_pos
    then argl
    else (Lprim(Pfield pos, [arg]), binding_kind) :: make_args (pos + 1)
  in make_args first_pos

let get_key_constr = function
  | {pat_desc=Tpat_construct (cstr,_)} -> cstr.cstr_tag
  | _ -> assert false

let get_args_constr p rem = match p with
| {pat_desc=Tpat_construct (_,args)} -> args @ rem
| _ -> assert false

let pat_as_constr = function
  | {pat_desc=Tpat_construct (cstr,_)} -> cstr
  | _ -> fatal_error "Matching.pat_as_constr"


let matcher_constr cstr = match cstr.cstr_arity with
| 0 ->
    let rec matcher_rec q rem = match q.pat_desc with
    | Tpat_or (p1,p2,_) ->
        begin
          try
            matcher_rec p1 rem
          with
          | NoMatch -> matcher_rec p2 rem
        end
    | Tpat_construct (cstr1, []) when cstr.cstr_tag = cstr1.cstr_tag ->
        rem
    | Tpat_any -> rem
    | _ -> raise NoMatch in
    matcher_rec
| 1 ->
    let rec matcher_rec q rem = match q.pat_desc with
    | Tpat_or (p1,p2,_) ->
        let r1 = try Some (matcher_rec p1 rem) with NoMatch -> None
        and r2 = try Some (matcher_rec p2 rem) with NoMatch -> None in
        begin match r1,r2 with
        | None, None -> raise NoMatch
        | Some r1, None -> r1
        | None, Some r2 -> r2
        | Some (a1::rem1), Some (a2::_) ->
            {a1 with
pat_loc = Location.none ;
pat_desc = Tpat_or (a1, a2, None)}::
            rem
        | _, _ -> assert false
        end
    | Tpat_construct (cstr1, [arg]) when cstr.cstr_tag = cstr1.cstr_tag ->
        arg::rem
    | Tpat_any -> omega::rem
    | _ -> raise NoMatch in
    matcher_rec
| _ ->
    fun q rem -> match q.pat_desc with
    | Tpat_or (_,_,_) -> raise OrPat
    | Tpat_construct (cstr1, args)
        when cstr.cstr_tag = cstr1.cstr_tag -> args @ rem
    | Tpat_any -> Parmatch.omegas cstr.cstr_arity @ rem
    | _        -> raise NoMatch

let make_constr_matching p def ctx = function
    [] -> fatal_error "Matching.make_constr_matching"
  | ((arg, mut) :: argl) ->
      let cstr = pat_as_constr p in
      let newargs =
        match cstr.cstr_tag with
          Cstr_constant _ | Cstr_block _ ->
            make_field_args Alias arg 0 (cstr.cstr_arity - 1) argl
        | Cstr_exception _ ->
            make_field_args Alias arg 1 cstr.cstr_arity argl in
      {pm=
        {cases = []; args = newargs;
          default = make_default (matcher_constr cstr) def} ;
        ctx =  filter_ctx p ctx ;
        pat=normalize_pat p}


let divide_constructor ctx pm =
  divide
    make_constr_matching
    get_key_constr get_args_constr
    ctx pm

(* Matching against a variant *)

let rec matcher_variant_const lab p rem = match p.pat_desc with
| Tpat_or (p1, p2, _) ->
    begin
      try
        matcher_variant_const lab p1 rem
      with
      | NoMatch -> matcher_variant_const lab p2 rem
    end
| Tpat_variant (lab1,_,_) when lab1=lab -> rem
| Tpat_any -> rem
| _   -> raise NoMatch

      
let make_variant_matching_constant p lab def ctx = function
    [] -> fatal_error "Matching.make_variant_matching_constant"
  | ((arg, mut) :: argl) ->
      let def = make_default (matcher_variant_const lab) def
      and ctx = filter_ctx p ctx in
      {pm={ cases = []; args = argl ; default=def} ;
        ctx=ctx ;
        pat = normalize_pat p}

let matcher_variant_nonconst lab p rem = match p.pat_desc with
| Tpat_or (_,_,_) -> raise OrPat
| Tpat_variant (lab1,Some arg,_) when lab1=lab -> arg::rem
| Tpat_any -> omega::rem
| _   -> raise NoMatch


let make_variant_matching_nonconst p lab def ctx = function
    [] -> fatal_error "Matching.make_variant_matching_nonconst"
  | ((arg, mut) :: argl) ->
      let def = make_default (matcher_variant_nonconst lab) def
      and ctx = filter_ctx p ctx in
      {pm=
        {cases = []; args = (Lprim(Pfield 1, [arg]), Alias) :: argl;
          default=def} ;
        ctx=ctx ;
        pat = normalize_pat p}

let get_key_variant p = match p.pat_desc with
| Tpat_variant(lab, Some _ , _) ->  Cstr_block (Btype.hash_variant lab)
| Tpat_variant(lab, None , _) -> Cstr_constant (Btype.hash_variant lab)
|  _ -> assert false

let divide_variant row ctx {cases = cl; args = al; default=def} =
  let row = Btype.row_repr row in
  let rec divide = function
      ({pat_desc = Tpat_variant(lab, pato, _)} as p:: patl, action) :: rem ->
        let variants = divide rem in
        if try Btype.row_field_repr (List.assoc lab row.row_fields) = Rabsent
        with Not_found -> true
        then
          variants
        else begin
          let tag = Btype.hash_variant lab in
          match pato with
            None ->
              add (make_variant_matching_constant p lab def ctx) variants
                (Cstr_constant tag) (patl, action) al               
          | Some pat ->
              add (make_variant_matching_nonconst p lab def ctx) variants
                (Cstr_block tag) (pat :: patl, action) al
        end
    | cl -> []
  in
  divide cl

(*
  Three ``no-test'' cases
  *)

(* Matching against a variable *)

let get_args_var _ rem = rem


let make_var_matching def = function
  | [] ->  fatal_error "Matching.make_var_matching"
  | _::argl ->
      {cases=[] ;
        args = argl ;
        default= make_default get_args_var def}

let divide_var ctx pm =
  divide_line ctx_lshift make_var_matching get_args_var omega ctx pm

(* Matching against a tuple pattern *)


let get_args_tuple arity p rem = match p with
| {pat_desc = Tpat_any} -> omegas arity @ rem
| {pat_desc = Tpat_tuple args} ->
    args @ rem
| _ ->  assert false

let matcher_tuple arity p rem = match p.pat_desc with
| Tpat_or (_,_,_)     -> raise OrPat
| Tpat_var _          -> get_args_tuple arity omega rem
| _                   ->  get_args_tuple arity p rem
      
let make_tuple_matching arity def = function
    [] -> fatal_error "Matching.make_tuple_matching"
  | (arg, mut) :: argl ->
      let rec make_args pos =
        if pos >= arity
        then argl
        else (Lprim(Pfield pos, [arg]), Alias) :: make_args (pos + 1) in
      {cases = []; args = make_args 0 ;
        default=make_default (matcher_tuple arity) def}


let divide_tuple arity p ctx pm =
  divide_line
    (filter_ctx p)
    (make_tuple_matching arity)
    (get_args_tuple  arity) p ctx pm

(* Matching against a record pattern *)


let record_matching_line num_fields lbl_pat_list =
  let patv = Array.create num_fields omega in
  List.iter (fun (lbl, pat) -> patv.(lbl.lbl_pos) <- pat) lbl_pat_list;
  Array.to_list patv

let get_args_record num_fields p rem = match p with
| {pat_desc=Tpat_any} ->
    record_matching_line num_fields [] @ rem
| {pat_desc=Tpat_record lbl_pat_list} ->
    record_matching_line num_fields lbl_pat_list @ rem
| _ -> assert false

let matcher_record num_fields p rem = match p.pat_desc with
| Tpat_or (_,_,_) -> raise OrPat
| Tpat_var _      -> get_args_record num_fields omega rem
| _               -> get_args_record num_fields p rem

let make_record_matching all_labels def = function
    [] -> fatal_error "Matching.make_record_matching"
  | ((arg, mut) :: argl) ->
      let rec make_args pos =
        if pos >= Array.length all_labels then argl else begin
          let lbl = all_labels.(pos) in
          let access =
            match lbl.lbl_repres with
              Record_regular -> Pfield lbl.lbl_pos
            | Record_float -> Pfloatfield lbl.lbl_pos in
          let str =
            match lbl.lbl_mut with
              Immutable -> Alias
            | Mutable -> StrictOpt in
          (Lprim(access, [arg]), str) :: make_args(pos + 1)
        end in
      let nfields = Array.length all_labels in
      let def= make_default (matcher_record nfields) def in
      {cases = []; args = make_args 0 ; default = def}


let divide_record all_labels p ctx pm =
  let get_args = get_args_record (Array.length all_labels) in
  divide_line
    (filter_ctx p)
    (make_record_matching all_labels)
    get_args
    p ctx pm

(* Matching against an array pattern *)

let get_key_array = function
  | {pat_desc=Tpat_array patl} -> List.length patl
  | _ -> assert false

let get_args_array p rem = match p with
| {pat_desc=Tpat_array patl} -> patl@rem
| _ -> assert false

let matcher_array len p rem = match p.pat_desc with
| Tpat_or (_,_,_) -> raise OrPat
| Tpat_array args when List.length args=len -> args @ rem
| Tpat_any -> Parmatch.omegas len @ rem
| _ -> raise NoMatch

let make_array_matching kind p def ctx = function
  | [] -> fatal_error "Matching.make_array_matching"
  | ((arg, mut) :: argl) ->
      let len = get_key_array p in
      let rec make_args pos =
        if pos >= len
        then argl
        else (Lprim(Parrayrefu kind, [arg; Lconst(Const_base(Const_int pos))]),
              StrictOpt) :: make_args (pos + 1) in
      let def = make_default (matcher_array len) def
      and ctx = filter_ctx p ctx in
      {pm={cases = []; args = make_args 0 ; default = def} ;
        ctx=ctx ;
        pat = normalize_pat p}

let divide_array kind ctx pm =
  divide
    (make_array_matching kind)
    get_key_array get_args_array ctx pm
    
(* To combine sub-matchings together *)

let float_compare s1 s2 =
  let f1 = float_of_string s1 and f2 = float_of_string s2 in
  Pervasives.compare f1 f2

let sort_lambda_list l =
  List.sort
    (fun (x,_) (y,_) -> match x,y with
    | Const_float f1, Const_float f2 -> float_compare f1 f2
    | _, _ -> Pervasives.compare x y)
    l

let rec cut n l =
  if n = 0 then [],l
  else match l with
    [] -> raise (Invalid_argument "cut")
  | a::l -> let l1,l2 = cut (n-1) l in a::l1, l2

let rec do_tests_fail fail tst arg = function
  | [] -> fail
  | (c, act)::rem ->
      Lifthenelse
        (Lprim (tst, [arg ; Lconst (Const_base c)]),
         do_tests_fail fail tst arg rem,
         act)

let rec do_tests_nofail tst arg = function
  | [] -> fatal_error "Matching.do_tests_nofail"
  | [_,act] -> act
  | (c,act)::rem ->
      Lifthenelse
        (Lprim (tst, [arg ; Lconst (Const_base c)]),
         do_tests_nofail tst arg rem,
         act)

let make_test_sequence fail tst lt_tst arg const_lambda_list =
  let rec make_test_sequence const_lambda_list =
    if List.length const_lambda_list >= 4 && lt_tst <> Praise then
      split_sequence const_lambda_list
    else match fail with
    | None -> do_tests_nofail tst arg const_lambda_list
    | Some fail -> do_tests_fail fail tst arg const_lambda_list

  and split_sequence const_lambda_list =
    let list1, list2 =
      cut (List.length const_lambda_list / 2) const_lambda_list in
    Lifthenelse(Lprim(lt_tst,[arg; Lconst(Const_base (fst(List.hd list2)))]),
                make_test_sequence list1, make_test_sequence list2)
  in make_test_sequence (sort_lambda_list const_lambda_list)


let make_offset x arg = if x=0 then arg else Lprim(Poffsetint(x), [arg])



let prim_string_notequal =
  Pccall{prim_name = "caml_string_notequal";
          prim_arity = 2; prim_alloc = false;
          prim_native_name = ""; prim_native_float = false}

let rec explode_inter offset i j act k =
  if i <= j then
    explode_inter offset i (j-1) act ((j-offset,act)::k)
  else
    k

let max_vals cases acts =
  let vals = Array.create (Array.length acts) 0 in
  for i=Array.length cases-1 downto 0 do
    let l,h,act = cases.(i) in
    vals.(act) <- h - l + 1 + vals.(act)
  done ;
  let max = ref 0 in
  for i = Array.length vals-1 downto 0 do
    if vals.(i) >= vals.(!max) then
      max := i
  done ;
  if vals.(!max) > 1 then
    !max
  else
    -1

let as_int_list cases acts =
  let default = max_vals cases acts in
  let min_key,_,_ = cases.(0)
  and _,max_key,_ = cases.(Array.length cases-1) in

  let rec do_rec i k =
    if i >= 0 then
      let low, high, act =  cases.(i) in
      if act = default then
        do_rec (i-1) k
      else
        do_rec (i-1) (explode_inter min_key low high acts.(act) k)
    else
      k in
  min_key, max_key,do_rec (Array.length cases-1) [],
  (if default >= 0 then Some acts.(default) else None)


let make_switch_offset arg min_key max_key int_lambda_list default  =
  let numcases = max_key - min_key + 1 in
  let cases =
    List.map (fun (key, l) -> (key - min_key, l)) int_lambda_list in
  let offsetarg = make_offset (-min_key) arg in
  Lswitch(offsetarg,
          {sw_numconsts = numcases; sw_consts = cases;
            sw_numblocks = 0; sw_blocks = [];
            sw_failaction = default})

let make_switch_switcher arg cases acts =
  let l = ref [] in
  for i = Array.length cases-1 downto 0 do
    l := (i,acts.(cases.(i))) ::  !l
  done ;    
  Lswitch(arg,
          {sw_numconsts = Array.length cases ; sw_consts = !l ;
            sw_numblocks = 0 ; sw_blocks =  []  ;
            sw_failaction = None})
    
let full sw =
  List.length sw.sw_consts = sw.sw_numconsts &&
  List.length sw.sw_blocks = sw.sw_numblocks
    
let make_switch (arg,sw) = match sw.sw_failaction with
| None ->
    let t = Hashtbl.create 17 in
    let seen l = match l with
    | Lstaticraise (i,[]) ->
        let old = try Hashtbl.find t i with Not_found -> 0 in
        Hashtbl.replace t i (old+1)
    | _ -> () in
    List.iter (fun (_,lam) -> seen lam) sw.sw_consts ;
    List.iter (fun (_,lam) -> seen lam) sw.sw_blocks ;
    let i_max = ref (-1)
    and max = ref (-1) in
    Hashtbl.iter
      (fun i c ->
        if c > !max then begin
          i_max := i ;
          max := c
        end) t ;
    if !i_max >= 0 then
      let default = !i_max in
      let rec remove = function
        | [] -> []
        | (_,Lstaticraise (j,[]))::rem when j=default ->
            remove rem
        | x::rem -> x::remove rem in
      Lswitch
        (arg,
         {sw with
sw_consts = remove sw.sw_consts ;
sw_blocks = remove sw.sw_blocks ;
sw_failaction = Some (Lstaticraise (default,[]))})
    else
      Lswitch (arg,sw)
| _ -> Lswitch (arg,sw)
      
module SArg = struct
  type primitive = Lambda.primitive

  let eqint = Pintcomp Ceq
  let neint = Pintcomp Cneq
  let leint = Pintcomp Cle
  let ltint = Pintcomp Clt
  let geint = Pintcomp Cge
  let gtint = Pintcomp Cgt

  type act = Lambda.lambda

  let make_prim p args = Lprim (p,args)
  let make_offset arg n = match n with
  | 0 -> arg
  | _ -> Lprim (Poffsetint n,[arg])
  let bind arg body =
    let newvar,newarg = match arg with
    | Lvar v -> v,arg
    | _      ->
        let newvar = Ident.create "switcher" in
        newvar,Lvar newvar in
    bind Alias newvar arg (body newarg)

  let make_isout h arg = Lprim (Pisout, [h ; arg])
  let make_isin h arg = Lprim (Pnot,[make_isout h arg])
  let make_if cond ifso ifnot = Lifthenelse (cond, ifso, ifnot)
  let make_switch = make_switch_switcher
end

module Switcher = Switch.Make(SArg)
open Switch

let lambda_of_int i =  Lconst (Const_base (Const_int i))

let rec last def = function
  | [] -> def
  | [x,_] -> x
  | _::rem -> last def rem

let get_edges low high l = match l with
| [] -> low, high
| (x,_)::_ -> x, last high l

      
let as_interval_canfail fail low high l =
  let store = mk_store equal_action in
  let rec nofail_rec cur_low cur_high cur_act = function
    | [] ->
        if cur_high = high then
          [cur_low,cur_high,cur_act]
        else
          [(cur_low,cur_high,cur_act) ; (cur_high+1,high, 0)]
    | ((i,act_i)::rem) as all ->
        let act_index = store.act_store act_i in
        if cur_high+1= i then
          if act_index=cur_act then
            nofail_rec cur_low i cur_act rem
          else if act_index=0 then
            (cur_low,i-1, cur_act)::fail_rec i i rem
          else
            (cur_low, i-1, cur_act)::nofail_rec i i act_index rem
        else
          (cur_low, cur_high, cur_act)::
          fail_rec ((cur_high+1)) (cur_high+1) all

  and fail_rec cur_low cur_high = function
    | [] -> [(cur_low, cur_high, 0)]
    | (i,act_i)::rem ->
        let index = store.act_store act_i in
        if index=0 then fail_rec cur_low i rem
        else
          (cur_low,i-1,0)::
          nofail_rec i i index rem in

  let rec init_rec = function
    | [] -> []
    | (i,act_i)::rem ->
        let index = store.act_store act_i in
        if index=0 then
          fail_rec low i rem
        else
          if low < i then
            (low,i-1,0)::nofail_rec i i index rem
          else
            nofail_rec i i index rem in

  ignore (store.act_store fail) ; (* fail has action index 0 *)
  let r = init_rec l in
  Array.of_list r,  store.act_get ()

let as_interval_nofail l =
  let store = mk_store equal_action in

  let rec i_rec cur_low cur_high cur_act = function
    | [] ->
        [cur_low, cur_high, cur_act]
    | (i,act)::rem ->
        let act_index = store.act_store act in
        if act_index = cur_act then
          i_rec cur_low i cur_act rem
        else
          (cur_low, cur_high, cur_act)::
          i_rec i i act_index rem in
  let inters = match l with
  | (i,act)::rem ->
      let act_index = store.act_store act in
      i_rec i i act_index rem
  | _ -> assert false in

  Array.of_list inters, store.act_get ()


let sort_int_lambda_list l =
  List.sort
    (fun (i1,_) (i2,_) ->
      if i1 < i2 then -1
      else if i2 < i1 then 1
      else 0)
    l

let as_interval fail low high l =
  let l = sort_int_lambda_list l in
  get_edges low high l,
  (match fail with
  | None -> as_interval_nofail l
  | Some act -> as_interval_canfail act low high l)

let call_switcher konst fail arg low high int_lambda_list =
  let edges, (cases, actions) =
    as_interval fail low high int_lambda_list in
  Switcher.zyva edges konst arg cases actions


let exists_ctx ok ctx =
  List.exists
    (function
      | {right=p::_} -> ok p
      | _ -> assert false)
    ctx

let rec list_as_pat = function
  | [] -> fatal_error "Matching.list_as_pat"
  | [pat] -> pat
  | pat::rem ->
      {pat with pat_desc = Tpat_or (pat,list_as_pat rem,None)}


let rec pat_as_list k = function
  | {pat_desc=Tpat_or (p1,p2,_)} ->
      pat_as_list (pat_as_list k p2) p1
  | p -> p::k

(* Extracting interesting patterns *)
exception All

let rec extract_pat seen k p = match p.pat_desc with
| Tpat_or (p1,p2,_) ->
    let k1,seen1 = extract_pat seen k p1 in
    extract_pat seen1 k1 p2
| Tpat_alias (p,_) ->
    extract_pat  seen k p
| Tpat_var _|Tpat_any ->
    raise All
| _ ->
    let q = normalize_pat p in
    if  List.exists (compat q) seen then
      k, seen
    else
      q::k, q::seen

let extract_mat seen pss =
  let r,_ =
    List.fold_left
      (fun (k,seen) ps -> match ps with
      | p::_ -> extract_pat seen k p
      | _ -> assert false)
      ([],seen)
      pss in
  r



let complete_pats_constrs = function
  | p::_ as pats ->
      List.map
        (pat_of_constr p)
        (complete_constrs p (List.map get_key_constr pats))
  | _ -> assert false


let mk_res get_key env last_choice idef cant_fail ctx =

  let env,fail,jumps_fail = match last_choice with
  | [] ->
      env, None, jumps_empty
  | [p] when group_var p ->
      env,
      Some (Lstaticraise (idef,[])),
      jumps_singleton idef ctx
  | _ ->
      (idef,cant_fail,last_choice)::env,
      None, jumps_empty in
  let klist,jumps =
    List.fold_right
      (fun (i,cant_fail,pats) (klist,jumps) ->
        let act = Lstaticraise (i,[])
        and pat = list_as_pat pats in
        let klist =
          List.fold_right
            (fun pat klist -> (get_key pat,act)::klist)
            pats klist              
        and ctx = if cant_fail then ctx else ctx_lub pat ctx in
        klist,jumps_add i ctx jumps)
      env ([],jumps_fail) in
  fail, klist, jumps
    

(*
     Following two ``failaction'' function compute n, the trap handler
    to jump to in case of failure of elementary tests
*)

let mk_failaction_neg partial ctx def = match partial with
| Partial ->
    begin match def with
    | (_,idef)::_ ->
        Some (Lstaticraise (idef,[])),[],jumps_singleton idef ctx
    | _ ->
       (* Act as Total, this means
          If no appropriate default matrix exists,
          then this switch cannot fail *)
        None, [], jumps_empty
    end
| Total ->
    None, [], jumps_empty

      
      
(* Conforme a l'article et plus simple qu'avant *)
and mk_failaction_pos partial seen ctx defs  =
  let rec scan_def env to_test defs = match to_test,defs with
  | ([],_)|(_,[]) ->
      List.fold_left
        (fun  (klist,jumps) (pats,i)->
          let action = Lstaticraise (i,[]) in
          let klist =
            List.fold_right
              (fun pat r -> (get_key_constr pat,action)::r)
              pats klist
          and jumps =
            jumps_add i (ctx_lub (list_as_pat pats) ctx) jumps in
          klist,jumps)
        ([],jumps_empty) env
  | _,(pss,idef)::rem ->
      let now, later =
        List.partition
          (fun (p,p_ctx) -> ctx_match p_ctx pss) to_test in
      match now with
      | [] -> scan_def env to_test rem
      | _  -> scan_def ((List.map fst now,idef)::env) later rem in

  scan_def
    []
    (List.map
       (fun pat -> pat, ctx_lub pat ctx)
       (complete_pats_constrs seen))
    defs

    
let combine_constant arg cst partial ctx def 
    (const_lambda_list, total, pats) =
  let fail, to_add, local_jumps =
    mk_failaction_neg partial ctx def in
  let const_lambda_list = to_add@const_lambda_list in
  let lambda1 =
    match cst with
    | Const_int _ ->
        let int_lambda_list =
          List.map (function Const_int n, l -> n,l | _ -> assert false)
            const_lambda_list in
        call_switcher
          lambda_of_int fail arg min_int max_int int_lambda_list
    | Const_char _ ->
        let int_lambda_list =
          List.map (function Const_char c, l -> (Char.code c, l)
            | _ -> assert false)
            const_lambda_list in
        call_switcher
          (fun i -> Lconst (Const_base (Const_int i)))
          fail arg 0 255 int_lambda_list
    | Const_string _ ->
        make_test_sequence
          fail prim_string_notequal Praise arg const_lambda_list
    | Const_float _ ->
        make_test_sequence
          fail
          (Pfloatcomp Cneq) (Pfloatcomp Clt)
          arg const_lambda_list
    | Const_int32 _ ->
        make_test_sequence
          fail
          (Pbintcomp(Pint32, Cneq)) (Pbintcomp(Pint32, Clt))
          arg const_lambda_list
    | Const_int64 _ ->
        make_test_sequence
          fail
          (Pbintcomp(Pint64, Cneq)) (Pbintcomp(Pint64, Clt))
          arg const_lambda_list
    | Const_nativeint _ ->
        make_test_sequence
          fail
          (Pbintcomp(Pnativeint, Cneq)) (Pbintcomp(Pnativeint, Clt))
          arg const_lambda_list
  in lambda1,jumps_union local_jumps total



let split_cases tag_lambda_list =
  let rec split_rec = function
      [] -> ([], [])
    | (cstr, act) :: rem ->
        let (consts, nonconsts) = split_rec rem in
        match cstr with
          Cstr_constant n -> ((n, act) :: consts, nonconsts)
        | Cstr_block n    -> (consts, (n, act) :: nonconsts)
        | _ -> assert false in
  let const, nonconst = split_rec tag_lambda_list in
  sort_int_lambda_list const,
  sort_int_lambda_list nonconst
    

let combine_constructor arg ex_pat cstr partial ctx def
    (tag_lambda_list, total1, pats) =
  if cstr.cstr_consts < 0 then begin
    (* Special cases for exceptions *)    
    let fail, to_add, local_jumps =
      mk_failaction_neg partial ctx def in
    let tag_lambda_list = to_add@tag_lambda_list in
    let lambda1 =
      let default, tests =
        match fail with
        | None ->
            begin match tag_lambda_list with
            | (_, act)::rem -> act,rem
            | _ -> assert false
            end
        | Some fail -> fail, tag_lambda_list in
      List.fold_right
        (fun (ex, act) rem ->
          match ex with
          | Cstr_exception path ->
              Lifthenelse(Lprim(Pintcomp Ceq,
                                [Lprim(Pfield 0, [arg]); transl_path path]),
                          act, rem)
          | _ -> assert false)
        tests default in
    lambda1, jumps_union local_jumps total1
  end else begin
    (* Regular concrete type *)
    let ncases = List.length tag_lambda_list
    and nconstrs =  cstr.cstr_consts + cstr.cstr_nonconsts in
    let sig_complete = ncases = nconstrs in
    let fails,local_jumps =
      if sig_complete then [],jumps_empty
      else
        mk_failaction_pos partial pats ctx def in

    let tag_lambda_list = fails @ tag_lambda_list in
    let (consts, nonconsts) = split_cases tag_lambda_list in
    let lambda1 =
      match same_actions tag_lambda_list with
      | Some act -> act
      | _ ->
          match
            (cstr.cstr_consts, cstr.cstr_nonconsts, consts, nonconsts)
          with
          | (1, 1, [0, act1], [0, act2]) ->
              Lifthenelse(arg, act2, act1)
          | (n,_,_,[])  ->
              call_switcher
                (fun i -> Lconst (Const_base (Const_int i)))
                None arg 0 (n-1) consts
          | (n, _, _, _) ->
              match same_actions nonconsts with
              | None ->
                  make_switch(arg, {sw_numconsts = cstr.cstr_consts;
                                     sw_consts = consts;
                                     sw_numblocks = cstr.cstr_nonconsts;
                                     sw_blocks = nonconsts;
                                     sw_failaction = None})
              | Some act ->
                  Lifthenelse
                    (Lprim (Pisint, [arg]),
                     call_switcher
                       (fun i -> Lconst (Const_base (Const_int i)))
                       None arg
                       0 (n-1) consts,
                     act) in
    lambda1, jumps_union local_jumps total1
  end

let make_test_sequence_variant_constant fail arg int_lambda_list =
  let _, (cases, actions) =
    as_interval fail min_int max_int int_lambda_list in
  Switcher.test_sequence
    (fun i -> Lconst (Const_base (Const_int i))) arg cases actions

let call_switcher_variant_constant fail arg int_lambda_list =
  call_switcher
    (fun i -> Lconst (Const_base (Const_int i)))
    fail arg min_int max_int int_lambda_list


let call_switcher_variant_constr fail arg int_lambda_list =
  let v = Ident.create "variant" in
  Llet(Alias, v, Lprim(Pfield 0, [arg]),
       call_switcher
         (fun i -> Lconst (Const_base (Const_int i)))
         fail (Lvar v) min_int max_int int_lambda_list)

let combine_variant row arg partial ctx def (tag_lambda_list, total1, pats) =
  let row = Btype.row_repr row in
  let num_constr = ref 0 in
  if row.row_closed then
    List.iter
      (fun (_, f) ->
        match Btype.row_field_repr f with
          Rabsent | Reither(true, _::_, _, _) -> ()
        | _ -> incr num_constr)
      row.row_fields
  else
    num_constr := max_int;
  let test_int_or_block arg if_int if_block =
    Lifthenelse(Lprim (Pisint, [arg]), if_int, if_block) in
  let sig_complete =  List.length tag_lambda_list = !num_constr
  and one_action = same_actions tag_lambda_list in
  let fail, to_add, local_jumps =
    if
      sig_complete  || (match partial with Total -> true | _ -> false)
    then
      None, [], jumps_empty
    else
      mk_failaction_neg partial ctx def in
  let tag_lambda_list = to_add@tag_lambda_list in
  let (consts, nonconsts) = split_cases tag_lambda_list in
  let lambda1 = match fail, one_action with
  | None, Some act -> act
  | _,_ ->
      match (consts, nonconsts) with
      | ([n, act1], [m, act2]) when fail=None ->
          test_int_or_block arg act1 act2
      | (_, []) -> (* One can compare integers and pointers *)
          make_test_sequence_variant_constant fail arg consts
      | ([], _) ->
          let lam = call_switcher_variant_constr
              fail arg nonconsts in
          (* One must not dereference integers *)
          begin match fail with
          | None -> lam
          | Some fail -> test_int_or_block arg fail lam
          end
      | (_, _) ->
          let lam_const =
            call_switcher_variant_constant
              fail arg consts
          and lam_nonconst =
            call_switcher_variant_constr
              fail arg nonconsts in
          test_int_or_block arg lam_const lam_nonconst
  in
  lambda1, jumps_union local_jumps total1

    
let combine_array arg kind partial ctx def
    (len_lambda_list, total1, pats)  =
  let fail, to_add, local_jumps = mk_failaction_neg partial  ctx def in
  let len_lambda_list = to_add @ len_lambda_list in
  let lambda1 =
    let newvar = Ident.create "len" in
    let switch =
      call_switcher
        lambda_of_int
        fail (Lvar newvar)
        0 max_int len_lambda_list in
    bind
      Alias newvar (Lprim(Parraylength kind, [arg])) switch in
  lambda1, jumps_union local_jumps total1

(* Insertion of debugging events *)

let rec event_branch repr lam =
  begin match lam, repr with
    (_, None) ->
      lam
  | (Levent(lam', ev), Some r) ->
      incr r;
      Levent(lam', {lev_loc = ev.lev_loc;
                    lev_kind = ev.lev_kind;
                    lev_repr = repr;
                    lev_env = ev.lev_env})
  | (Llet(str, id, lam, body), _) ->
      Llet(str, id, lam, event_branch repr body)
  | Lstaticraise _,_ -> lam
  | (_, Some r) ->
      Printlambda.lambda Format.str_formatter lam ;
      fatal_error
        ("Matching.event_branch: "^Format.flush_str_formatter ())
  end


(*
   This exception is raised when the compiler cannot produce code
   because control cannot reach the compiled clause,

   Unused is raised initialy in compile_test.

   compile_list (for compiling switch results) catch Unused

   comp_match_handlers (for compililing splitted matches)
   may reraise Unused

  
*)

exception Unused 

let compile_list compile_fun division = 

  let rec c_rec totals = function
  | [] -> [], jumps_unions totals, []
  | (key, cell) :: rem ->
      begin match cell.ctx with
      | [] -> c_rec totals rem
      | _  ->
          try
            let (lambda1, total1) = compile_fun cell.ctx cell.pm in            
            let c_rem, total, new_pats =
              c_rec
                (jumps_map ctx_combine total1::totals) rem in
            ((key,lambda1)::c_rem), total, (cell.pat::new_pats)
          with
          | Unused -> c_rec totals rem
      end in
  c_rec [] division


let compile_orhandlers compile_fun lambda1 total1 ctx to_catch =
  let rec do_rec r total_r = function
    | [] -> r,total_r
    | (mat,i,vars,pm)::rem ->
        begin try
          let ctx = select_columns mat ctx in
          let handler_i, total_i = compile_fun ctx pm in
          match raw_action r with
          | Lstaticraise (j,args) ->
              if i=j then
                List.fold_right2 (bind Alias) vars args handler_i,
                jumps_map (ctx_rshift_num (ncols mat)) total_i
              else
                do_rec r total_r rem
          | _ ->
              do_rec
                (Lstaticcatch (r,(i,vars), handler_i))
                (jumps_union
                   (jumps_remove i total_r)
                   (jumps_map (ctx_rshift_num (ncols mat)) total_i))
              rem
        with
        | Unused ->
            do_rec (Lstaticcatch (r, (i,vars), lambda_unit)) total_r rem
        end in
  do_rec lambda1 total1 to_catch


let compile_test compile_fun partial divide combine ctx to_match =
  let division = divide ctx to_match in
  let c_div = compile_list compile_fun division in
  match c_div with
  | [],_,_ ->
     begin match mk_failaction_neg partial ctx to_match.default with
     | None,_,_ -> raise Unused
     | Some l,_,total -> l,total
     end
  | _ ->
      combine ctx to_match.default c_div

(* Attempt to avoid some useless bindings by lowering them *)

(* Approximation of v present in lam *)
let rec approx_present v = function
  | Lconst _ -> false
  | Lstaticraise (_,args) ->
      List.exists (fun lam -> approx_present v lam) args
  | Lprim (_,args) ->
      List.exists (fun lam -> approx_present v lam) args
  | Llet (Alias, _, l1, l2) ->
      approx_present v l1 || approx_present v l2
  | Lvar vv -> Ident.same v vv
  | _ -> true

let string_of_lam lam =
  Printlambda.lambda Format.str_formatter lam ;
  Format.flush_str_formatter ()

let rec lower_bind v arg lam = match lam with
| Lifthenelse (cond, ifso, ifnot) ->
    let pcond = approx_present v cond
    and pso = approx_present v ifso
    and pnot = approx_present v ifnot in
    begin match pcond, pso, pnot with
    | false, false, false -> lam
    | false, true, false ->        
        Lifthenelse (cond, lower_bind v arg ifso, ifnot)
    | false, false, true ->
        Lifthenelse (cond, ifso, lower_bind v arg ifnot)
    | _,_,_ -> bind Alias v arg lam
    end
| Lswitch (ls,({sw_consts=[i,act] ; sw_blocks = []} as sw))
    when not (approx_present v ls) ->
      Lswitch (ls, {sw with sw_consts = [i,lower_bind v arg act]})
| Lswitch (ls,({sw_consts=[] ; sw_blocks = [i,act]} as sw))
    when not (approx_present v ls) ->
      Lswitch (ls, {sw with sw_blocks = [i,lower_bind v arg act]})
| Llet (Alias, vv, lv, l) ->
    if approx_present v lv then
      bind Alias v arg lam
    else
      Llet (Alias, vv, lv, lower_bind v arg l)
| _ -> 
    bind Alias v arg lam

let bind_check str v arg lam = match str,arg with
| _, Lvar _ ->bind str v arg lam
| Alias,_ -> lower_bind v arg lam 
| _,_     -> bind str v arg lam

let rec comp_exit ctx m = match m.default with
| (_,i)::_ -> Lstaticraise (i,[]), jumps_singleton i ctx
| _        -> fatal_error "Matching.comp_exit"

        

let rec comp_match_handlers comp_fun partial ctx arg first_match next_matchs = match next_matchs with
  | [] -> comp_fun partial ctx arg first_match
  | rem ->
      let rec c_rec body total_body = function
        | [] -> body, total_body
        (* Hum, -1 meant never taken
        | (-1,pm)::rem -> c_rec body total_body rem *)
        | (i,pm)::rem -> 
            let ctx_i,total_rem = jumps_extract i total_body in
            begin match ctx_i with
            | [] -> c_rec body total_body rem
            | _ ->
                try
                  let li,total_i =
                    comp_fun
                      (match rem with [] -> partial | _ -> Partial)
                      ctx_i arg pm in
                  c_rec
                    (Lstaticcatch (body,(i,[]),li))
                    (jumps_union total_i total_rem)
                    rem
                with
                | Unused ->
                    c_rec (Lstaticcatch (body,(i,[]),lambda_unit))
                      total_rem  rem
            end in
   try
      let first_lam,total = comp_fun Partial ctx arg first_match in
      c_rec first_lam total rem
   with Unused -> match next_matchs with
   | [] -> raise Unused
   | (_,x)::xs ->  comp_match_handlers comp_fun partial ctx arg x xs

(* To find reasonable names for variables *)

let rec name_pattern default = function
    (pat :: patl, action) :: rem ->
      begin match pat.pat_desc with
        Tpat_var id -> id
      | Tpat_alias(p, id) -> id
      | _ -> name_pattern default rem
      end
  | _ -> Ident.create default

let arg_to_var arg cls = match arg with
| Lvar v -> v,arg
| _ ->
    let v = name_pattern "match" cls in
    v,Lvar v


(*
  The main compilation function.
   Input:
      repr=used for inserting debug events
      partial=exhaustiveness information from Parmatch
      ctx=a context
      m=a pattern matching

   Output: a lambda term, a jump summary {..., exit number -> context, .. }
*)


let rec compile_match repr partial ctx m = match m with
| { cases = [] } -> comp_exit ctx m
| { cases = ([], action) :: rem } ->
    if is_guarded action then begin
      let (lambda, total) =
        compile_match None partial ctx { m with cases = rem } in
      event_branch repr (patch_guarded lambda action), total
    end else
      (event_branch repr action, jumps_empty)
| { args = (arg, str)::argl } ->
    let v,newarg = arg_to_var arg m.cases in
    let first_match,rem =
      split_precompile (Some v)
        { m with args = (newarg, Alias) :: argl } in
    let (lam, total) =
      comp_match_handlers
        (do_compile_matching repr) partial ctx newarg first_match rem in
    bind_check str v arg lam, total
| _ -> assert false


(* verbose version of do_compile_matching, for debug *)
(*
and do_compile_matching_pr repr partial ctx arg x =
  prerr_string "COMPILE: " ;
  prerr_endline (match partial with Partial -> "Partial" | Total -> "Total") ;
  prerr_endline "MATCH" ;
  pretty_precompiled x ;
  prerr_endline "CTX" ;
  pretty_ctx ctx ;
  let (_, jumps) as r =  do_compile_matching repr partial ctx arg x in
  prerr_endline "JUMPS" ;
  pretty_jumps jumps ;    
  r
*)
and do_compile_matching repr partial ctx arg pmh = match pmh with
| Pm pm ->
  let pat = what_is_cases pm.cases in
  begin match pat.pat_desc with
  | Tpat_any ->
      compile_no_test 
        divide_var ctx_rshift repr partial ctx pm
  | Tpat_tuple patl ->
      compile_no_test
        (divide_tuple (List.length patl) (normalize_pat pat)) ctx_combine
        repr partial ctx pm
  | Tpat_record ((lbl,_)::_) ->
      compile_no_test
        (divide_record lbl.lbl_all (normalize_pat pat))
        ctx_combine repr partial ctx pm
  | Tpat_constant cst ->
      compile_test
        (compile_match repr partial) partial
        divide_constant
        (combine_constant arg cst partial)
        ctx pm
  | Tpat_construct (cstr, _) ->
      compile_test
        (compile_match repr partial) partial
        divide_constructor (combine_constructor arg pat cstr partial)
        ctx pm
  | Tpat_array _ ->    
      let kind = Typeopt.array_pattern_kind pat in
      compile_test (compile_match repr partial) partial
        (divide_array kind) (combine_array arg kind partial)
        ctx pm
  | Tpat_variant(lab, _, row) ->
      compile_test (compile_match repr partial) partial
        (divide_variant !row)
        (combine_variant !row arg partial)
        ctx pm
  | _ -> assert false
  end
| PmVar {inside=pmh ; var_arg=arg} ->
    let lam, total =
      do_compile_matching repr partial (ctx_lshift ctx) arg pmh in
    lam, jumps_map ctx_rshift total
| PmOr {body=body ; handlers=handlers} ->
    let lam, total = compile_match repr partial ctx body in
    compile_orhandlers (compile_match repr partial) lam total ctx handlers

and compile_no_test divide up_ctx repr partial ctx to_match =
  let {pm=this_match ; ctx=this_ctx } = divide ctx to_match in
  let lambda,total = compile_match repr partial this_ctx this_match in
  lambda, jumps_map up_ctx total




(* The entry points *)

(*
   If there is a guard in a matching, then
   set exhaustiveness info to Partial.
   (because of side effects in guards, assume the worst)
*)

let check_partial pat_act_list partial =
  if
    List.exists
      (fun (_,lam) -> is_guarded lam)
       pat_act_list
  then begin
    Partial 
  end else
    partial


(* have toplevel handler when appropriate *)

let start_ctx n = [{left=[] ; right = omegas n}]

let check_total total lambda i handler_fun =
  if jumps_is_empty total then
    lambda
  else begin
    Lstaticcatch(lambda, (i,[]), handler_fun())
  end

let compile_matching loc repr handler_fun arg pat_act_list partial =
  let partial = check_partial pat_act_list partial in
  match partial with
  | Partial ->
      let raise_num = next_raise_count () in
      let pm =
        { cases = List.map (fun (pat, act) -> ([pat], act)) pat_act_list;
          args = [arg, Strict] ;
          default = [[[omega]],raise_num]} in
      begin try
        let (lambda, total) = compile_match repr partial (start_ctx 1) pm in
        check_total total lambda raise_num handler_fun
      with
      | Unused -> assert false (* ; handler_fun() *)
      end
  | Total ->
      let pm =
        { cases = List.map (fun (pat, act) -> ([pat], act)) pat_act_list;
          args = [arg, Strict] ;
          default = []} in
      let (lambda, total) = compile_match repr partial (start_ctx 1) pm in
      assert (jumps_is_empty total) ;
      lambda


let partial_function loc () =
  (* [Location.get_pos_info] is too expensive *)
  let fname = match loc.Location.loc_start.Lexing.pos_fname with
              | "" -> !Location.input_name
              | x -> x
  in
  let pos = loc.Location.loc_start in
  let line = pos.Lexing.pos_lnum in
  let char = pos.Lexing.pos_cnum - pos.Lexing.pos_bol in
  Lprim(Praise, [Lprim(Pmakeblock(0, Immutable),
          [transl_path Predef.path_match_failure;
           Lconst(Const_block(0,
              [Const_base(Const_string fname);
               Const_base(Const_int line);
               Const_base(Const_int char)]))])])

let for_function loc repr param pat_act_list partial =
  compile_matching loc repr (partial_function loc) param pat_act_list partial

(* In the following two cases, exhaustiveness info is not available! *)
let for_trywith param pat_act_list =
  compile_matching Location.none None (fun () -> Lprim(Praise, [param]))
    param pat_act_list Partial

let for_let loc param pat body =
  compile_matching loc None (partial_function loc) param [pat, body] Partial

(* Handling of tupled functions and matchings *)

(* Easy case since variables are available *)
let for_tupled_function loc paraml pats_act_list partial =
  let partial = check_partial pats_act_list partial in
  let raise_num = next_raise_count () in
  let omegas = [List.map (fun _ -> omega) paraml] in
  let pm =
    { cases = pats_act_list;
      args = List.map (fun id -> (Lvar id, Strict)) paraml ;
      default = [omegas,raise_num]
    } in
  try
    let (lambda, total) = compile_match None partial
        (start_ctx (List.length paraml)) pm in
    check_total total lambda raise_num (partial_function loc)
  with
  | Unused -> partial_function loc ()



let flatten_pattern size p = match p.pat_desc with
| Tpat_tuple args -> args
| Tpat_any -> omegas size  
| _ -> raise Cannot_flatten

let rec flatten_pat_line size p k = match p.pat_desc with
| Tpat_any ->  omegas size::k
| Tpat_tuple args -> args::k
| Tpat_or (p1,p2,_) ->  flatten_pat_line size p1 (flatten_pat_line size p2 k)
| Tpat_alias (p,_) -> (* Note: if this 'as' pat is here, then this is a useless
                         binding, solves PR #3780 *)
    flatten_pat_line size p k
| _ -> fatal_error "Matching.flatten_pat_line"

let flatten_cases size cases =
  List.map
    (fun (ps,action) -> match ps with
    | [p] -> flatten_pattern size p,action
    | _ -> fatal_error "Matching.flatten_case")
    cases

let flatten_matrix size pss =
  List.fold_right
    (fun ps r -> match ps with
    | [p] -> flatten_pat_line size p r
    | _   -> fatal_error "Matching.flatten_matrix")
    pss []

let flatten_def size def =
  List.map
    (fun (pss,i) -> flatten_matrix size pss,i)
    def

let flatten_pm size args pm =
    {args = args ; cases = flatten_cases size pm.cases ;
     default = flatten_def size pm.default}


let rec flatten_precompiled size args  pmh = match pmh with
| Pm pm -> Pm (flatten_pm size args pm)
| PmOr {body=b ; handlers=hs ; or_matrix=m} ->
    PmOr
      {body=flatten_pm size args b ;
       handlers=
         List.map
          (fun (mat,i,vars,pm) -> flatten_matrix size mat,i,vars,pm)
          hs ;
       or_matrix=flatten_matrix size m ;}
| PmVar _ -> assert false

(*
   compiled_flattened is a ``comp_fun'' argument to comp_match_handlers.
   Hence it needs a fourth argument, which it ignores
*)

let compile_flattened repr partial ctx _ pmh = match pmh with
| Pm pm -> compile_match repr partial ctx pm
| PmOr {body=b ; handlers=hs} ->
    let lam, total = compile_match repr partial ctx b in
    compile_orhandlers (compile_match repr partial) lam total ctx hs
| PmVar _ -> assert false

let for_multiple_match loc paraml pat_act_list partial =
  let repr = None in
  let partial = check_partial pat_act_list partial in
  let raise_num,pm1 =
    match partial with
    | Partial ->
        let raise_num = next_raise_count () in
        raise_num,
        { cases = List.map (fun (pat, act) -> ([pat], act)) pat_act_list;
          args = [Lprim(Pmakeblock(0, Immutable), paraml), Strict] ;
          default = [[[omega]],raise_num] }
    | _ ->
        -1,
        { cases = List.map (fun (pat, act) -> ([pat], act)) pat_act_list;
          args = [Lprim(Pmakeblock(0, Immutable), paraml), Strict] ;
          default = [] } in
  
  try
    try
(* Once for checking that compilation is possible *)
      let next, nexts = split_precompile None pm1 in

      let size = List.length paraml
      and idl = List.map (fun _ -> Ident.create "match") paraml in
      let args =  List.map (fun id -> Lvar id, Alias) idl in

      let flat_next = flatten_precompiled size args next
      and flat_nexts =
        List.map
          (fun (e,pm) ->  e,flatten_precompiled size args pm)
          nexts in

      let lam, total =
        comp_match_handlers 
          (compile_flattened repr)
          partial (start_ctx size) () flat_next flat_nexts in
      List.fold_right2 (bind Strict) idl paraml
        (match partial with
        | Partial ->
            check_total total lam raise_num (partial_function loc)
        | Total ->
            assert (jumps_is_empty total) ;
            lam)
    with Cannot_flatten ->
      let (lambda, total) = compile_match None partial (start_ctx 1) pm1 in
      begin match partial with
      | Partial ->
          check_total total lambda raise_num (partial_function loc)
      | Total ->
          assert (jumps_is_empty total) ;
          lambda
      end
  with Unused ->
    assert false (* ; partial_function loc () *)

