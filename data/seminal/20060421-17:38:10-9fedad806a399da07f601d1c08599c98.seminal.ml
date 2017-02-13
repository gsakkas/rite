
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

let rec getFieldType lst str = (* ############################### *)
  match lst with
    [] -> None
  | (s,t,a)::tl -> if s=str then Some (t,a) else getFieldType tl str

(******** Problem 1: complete subtype and typecheck *********)
let rec subtype t1 t2 = (* ############################# *)
  match t1,t2 with
        IntT, IntT -> true
      | ArrowT(arg1, res1), ArrowT(arg2, res2) -> 
              (subtype arg2 arg1) && (subtype res1 res2)
      | RecordT fldlst1, RecordT fldlst2 -> 
              let fldtst2 fld2 fld1 = 
                   if fld2 == fld1 then true else
                       match fld1,fld2 with
                       (_,_,Read),(_,_,Write) -> false
                      |(_,_,Write),(_,_,Read) -> false
                      |(st1,ty1,Both),(st2,ty2,_) ->
                                      (st1=st2) && (subtype ty1 ty2)
                      | _ -> false
              in let fldtst fld2 = List.exists (fldtst2 fld2) fldlst1
              in List.for_all fldtst fldlst2 
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
      let e2typ = typecheck ctxt e2 in
      let e1typ = typecheck ctxt e1 in
      (
      match e1typ with
      ArrowT(at1,at2) ->
              if subtype e2typ at2 then e1typ
              else raise (DoesNotTypecheck "bad e2 in Apply")
      | _ -> raise (DoesNotTypecheck "bad e1 in Apply") 
      )
  | If(e1, e2, e3) ->
      let e1typ = typecheck ctxt e1 in
      let e2typ = typecheck ctxt e2 in
      let e3typ = typecheck ctxt e3 in
      if (subtype e1typ IntT) then
             (match (subtype e2typ e3typ),(subtype e3typ e2typ) with
              (_,true) -> e2typ
             |(true,false) -> e3typ
             |(false,false) -> raise (DoesNotTypecheck "fail in if")
             ) else raise (DoesNotTypecheck "fail in if test")
  | RecordV e -> 
      raise (DoesNotTypecheck "RecordV e in source program")
  | Letrec(t1,_,_,t2,e) ->
      let etyp = typecheck ctxt e in
      (
      match etyp with
      ArrowT(at1,at2) -> 
              if subtype t1 at2 && subtype at1 t2 then etyp
              else raise (DoesNotTypecheck "bad argtypes in Letrec")
     | _ -> raise (DoesNotTypecheck "bad f type in Letrec")
      )
  | Get(e, s) ->
          let gettst (es,et,ea) = 
              if (es=s) && (ea<>Write) then et else ()
          in List. exists gettst e          
          (*
##############################################################
####################################################################
*)
  | _ -> raise Unimplemented

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
