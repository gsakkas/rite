
exception Unimplemented
exception RuntimeTypeError
exception DoesNotTypecheck of string

(****** Syntax for our language, including types (do not change) *****)
type exp = Var of string 
         | Lam of string * typ * exp
	 | Apply of exp * exp
	 | Closure of string * exp * (env ref)
	 | Int of int
	 | Plus of exp * exp
	 | If of exp * exp * exp
	 | RecordE of (string * exp) list
	 | RecordV of (string * (exp ref)) list (* ################## *)
	 | Get of exp * string
	 | Set of exp * string * exp
	 | Letrec of typ * string *  string * typ * exp
	 | Cast of exp * typ

and env = (string * exp) list

and access = Read | Write | Both

and typ = IntT
        | ArrowT of typ * typ
	| RecordT of (string * typ * access) list

and ctxt = (string * typ) list

(****** Interpreter for our language (do not change) *****)
let rec interp env e =
  match e with
    Var s -> (try List.assoc s env with Not_found -> raise RuntimeTypeError)
  | Lam(s,_,e2) -> Closure(s,e2,ref env) 
  | Closure _ -> e 
  | Apply(e1,e2) ->
      let v1 = interp env e1 in
      let v2 = interp env e2 in
      (match v1 with
	Closure(s,e3,env2) -> interp((s,v2)::(!env2)) e3
      | _ -> raise RuntimeTypeError)
  | Plus(e1,e2) ->
      let v1 = interp env e1 in
      let v2 = interp env e2 in
      (match(v1,v2) with
	(Int i, Int j) -> Int (i+j)
      | _ -> raise RuntimeTypeError)
  | If(e1,e2,e3) ->
      let v1 = interp env e1 in
      (match v1 with
	Int 0 -> interp env e3
      | Int _ -> interp env e2
      | _ -> raise RuntimeTypeError)
  | Int _ -> e
  | RecordV _ -> e
  | RecordE lst -> RecordV (List.map (fun (s,r) -> (s,ref(interp env r))) lst)
  | Get(e,s) -> 
      (match interp env e with
	RecordV lst -> 
	  (try !(List.assoc s lst) with Not_found -> raise RuntimeTypeError)
      | _ -> raise RuntimeTypeError)
  | Set(e1,s,e2) ->
      (match interp env e1 with	
	RecordV lst -> 
	  let r=try List.assoc s lst with Not_found -> raise RuntimeTypeError in
	  let ans = interp env e2 in 
	  r := ans; ans
      | _ -> raise RuntimeTypeError)
  | Letrec(_,f,x,_,e) ->
      let r = ref env in
      let c = Closure(x,e,r) in
      let _ = r := (f,c)::(!r) in
      c
  | Cast(e,t) -> interp env e

let interp e = interp [] e

(***** helper functions provided to you (do not change) *****)
let fields_unique lst = (*raise exception if same field name appears > 1 time*)
  let rec loop lst1 lst2 =
    match lst2 with
      [] -> ()
    | (s,t,a)::tl -> 
	if (List.exists (fun (s2,_,_) -> s2=s) lst1)
	then raise (DoesNotTypecheck "")
	else loop ((s,t,a)::lst1) tl in
  loop [] lst

let rec checkType t = (* ################################################### *)
  match t with
    IntT -> ()
  | ArrowT(t1,t2) -> checkType t1; checkType t2
  | RecordT lst -> fields_unique lst; List.iter (fun (_,t,_) -> checkType t) lst

let rec getFieldType lst str = (* ############################################################### *)
  match lst with
    [] -> None
  | (s,t,a)::tl -> if s=str then Some (t,a) else getFieldType tl str

(******** Problem 1: complete subtype and typecheck *********)
let rec subtype t1 t2 = (* ############################# *)
  match t1,t2 with
    IntT,IntT -> true
  | ArrowT(at1,at2),ArrowT(at3,at4) -> if subtype at3 at1 then subtype at2 at4 else false
  | RecordT(_),RecordT([]) -> true
  | RecordT((s1,rt1,a1)::tl1),RecordT((s2,rt2,a2)::tl2) ->
      (* ################# *)
      let widthcheck =
        if s2=s1 
        then let depthcheck = match a1,a2 with
             Both,_ -> subtype rt1 rt2
           | Read,Read -> subtype rt1 rt2
           | Write,Write -> subtype rt1 rt2
           | _ -> false in
           if depthcheck then subtype RecordT(tl1) RecordT(tl2) else false
        else subtype RecordT(tl1) t2
        in
      (* #################################################################################################################### *)
      if widthcheck then subtype t1 RecordT(tl2) else false
  | _ -> false

let rec typecheck ctxt e = (* ########################### *)
  (* ###################### *)
  match e with
    Var s -> (try List.assoc s ctxt with Not_found -> raise (DoesNotTypecheck ""))
  | Lam(s,t,e) -> checkType t; ArrowT(t,typecheck ((s,t)::ctxt) e)
  | Closure _ -> raise (DoesNotTypecheck "not a source program")
  | Int _ -> IntT
  | Plus(e1,e2) ->
      if subtype (typecheck ctxt e1) IntT && subtype (typecheck ctxt e2) IntT
      then IntT
      else raise (DoesNotTypecheck "")
  | Apply(e1,e2) -> 
      let t = (typecheck ctxt e1) in
      if subtype t (typecheck ctxt e2) 
      then t
      else raise (DoesNotTypecheck "")
  | If(e1,e2,e3) -> 
      let t2 = (typecheck ctxt e2) in
      let t3 = (typecheck ctxt e3) in
      if subtype (typecheck ctxt e1) IntT 
      then 
        if subtype t2 t3 
        then t2
        else 
          if subtype t3 t2 
          then t3
          else raise (DoesNotTypecheck "")
      else raise (DoesNotTypecheck "")
  | RecordE(lt) -> 
      let t = RecordT(List.map (function (s,e) -> (s,e,Both)) lt) in
      checkType t; t 
  | RecordV -> raise (DoesNotTypecheck "")
  | Get(e,s) -> 
      match getFieldType (typecheck ctxt e) s with
        None -> raise (DoesNotTypecheck "")
      | (t,a) -> if a = Write then raise (DoesNotTypecheck "") else t
  | Set(e1,s,e2) ->
      match getFieldType (typecheck ctxt e1) s with
        None -> raise (DoesNotTypecheck "")
      | (t,a) -> 
         if a = Read then raise (DoesNotTypecheck "") 
         else if subtype (typecheck ctxt e2) t then t
         else raise (DoesNotTypecheck "") 
  | Letrec(t1,s1,s2,t2,e) -> 
      checktype t1; checktype t2;
      if subtype t2 (typecheck ([(s2,t2);(s1,ArrowT(t2,t1))]::ctxt) e)
      then ArrowT(t2,t1)
      else raise (DoesNotTypecheck "") 
  | Cast(e,t) -> checktype t; if subtype (typecheck ctxt e) t then t else raise (DoesNotTypecheck "") 

let typecheck e = typecheck [] e

(********** examples and testing ***********)

(* #########################################################################
########################################################### *)

(* ################################################################ *)
let lam x t e = Lam(x,t,e)
let app e1 e2 = Apply(e1,e2)
let vx = Var "x"
let vy = Var "y"
let vf = Var "f"

(* #################################################### *)
(* #############################################################################
##########
############################################################
#################################################
###########################################################

######################
###################

#############################################################################
##########
#########################################################################
#######################
##################
##############################
######################################################
##########################################################
###########################
######################################
##########################################

######################
###################

###################
#####################################################
#######################################################
#####################################################
#######################################################

 *)
