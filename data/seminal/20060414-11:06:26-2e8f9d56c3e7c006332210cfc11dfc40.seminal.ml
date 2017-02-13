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
	then raise (DoesNotTypecheck ("Duplicate record field name: " ^ s))
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

let rec t2str t =
  match t with
    IntT -> "IntT"
  | ArrowT(t1,t2) -> ("(" ^ (t2str t1) ^ ") -> (" ^ (t2str t2) ^ ")")
  | RecordT lst -> 
      "Rec[" ^ 
      (List.fold_left (fun cur (s,t,a) -> (if 0 = (String.length cur) then cur ^
      "(\"" else cur ^ ", (\"") ^ s ^ "\", " ^ (t2str t) ^
      (match a with Read -> ", Read)" | Write -> ", Write)" | Both -> ",
      Both)")) "" lst) ^ 
      "]"

let rec subtype t1 t2 = (* ############################# *)
  match t1,t2 with
    IntT, IntT -> true
  | ArrowT(t1,t2), ArrowT(t3,t4) -> ((subtype t3 t1) && (subtype t2 t4)) 
  | RecordT sub, RecordT super -> List.for_all (fun (sSuper, tSuper, aSuper) -> 
      match getFieldType sub sSuper with
        None -> false
      | Some (tSub, aSub) -> (subtype tSub tSuper) && match (aSub, aSuper) with
          Read, Read -> true
        | Write, Write -> true
        | Both, _ -> true (* ####################################### *)
        | _ -> false) super
  | _ -> false

let rec typecheck ctxt e = (* ########################### *)
  (* ###################### *)
  match e with
    Var s -> (try List.assoc s ctxt with Not_found -> raise (DoesNotTypecheck
    ("Undefined variable: " ^ s)))
  | Lam(s,t,e) -> checkType t; ArrowT(t,typecheck ((s,t)::ctxt) e)
  | Closure _ -> raise (DoesNotTypecheck "not a source program (Closure)")
  | Int _ -> IntT
  | Plus(e1,e2) ->
      if subtype (typecheck ctxt e1) IntT 
      then if subtype (typecheck ctxt e2) IntT
        then IntT
        else raise (DoesNotTypecheck ("Bad arg type in Plus. Expected IntT or subtype, got " ^ t2str (typecheck ctxt e2)))
      else raise (DoesNotTypecheck ("Bad arg type in Plus. Expected IntT or subtype, got " ^ t2str (typecheck ctxt e1)))
  | Apply(e1, e2) ->
      (match typecheck ctxt e1 with
        ArrowT(tArg, tRes) -> if subtype (typecheck ctxt e2) tArg 
          then tRes
          else raise (DoesNotTypecheck ("Bad arg type in Apply. Expected " ^
          (t2str tArg) ^ " or subtype, got " ^ (t2str (typecheck ctxt e2))))
      | _ -> raise (DoesNotTypecheck ("Bad fun
type in Apply.  Expected ArrowT(_,_), got " ^ (t2str (typecheck ctxt e1)))))
  | If(e1, e2, e3) -> 
      if subtype (typecheck ctxt e1) IntT 
      then 
        let t2 = typecheck ctxt e2 in
        let t3 = typecheck ctxt e3 in
        if subtype t2 t3 
        then t3
        else 
          if subtype t3 t2
          then t2
          else raise (DoesNotTypecheck ("Mismatching then/else types in If: " ^
      (t2str t2) ^ " and " ^ (t2str t3)))
      else raise (DoesNotTypecheck ("Bad test type in If. Expected IntT or subtype, got " ^ (t2str (typecheck ctxt e1))))
  | RecordE(lst) -> 
      let t = List.map (fun (s,e) -> (s, (typecheck ctxt e), Both)) lst in
      fields_unique t; RecordT(t)
  | RecordV _ -> raise (DoesNotTypecheck "not a source program (RecordV)")
  | Get(e,s) -> (match typecheck ctxt e with
      RecordT lst -> (match getFieldType lst s with
          Some (t, Read) -> t
        | Some (t, Both) -> t
        | Some (t, Write) -> 
            raise (DoesNotTypecheck ("Get called on write-only field: " ^ s))
        | None -> raise (DoesNotTypecheck ("Missing field in Get: " ^ s)))
    | _ -> raise(DoesNotTypecheck ("Bad record type in Get.  Expected RecordT _, got " ^ (t2str (typecheck ctxt e)))))
  | Set(e1,s,e2) -> (match typecheck ctxt e1 with
      RecordT lst -> (match getFieldType lst s with
          Some (t, Write) -> 
            if subtype (typecheck ctxt e2) t 
            then t 
            else raise (DoesNotTypecheck ("Bad rvalue type in Set(" ^ s ^ "). Expected " ^ (t2str t) ^ " or subtype, got " ^ (t2str (typecheck
            ctxt e2))))
        | Some (t, Both) -> 
            if subtype (typecheck ctxt e2) t 
            then t 
            else raise (DoesNotTypecheck ("Bad rvalue type in Set(" ^ s ^ "). Expected " ^ (t2str t) ^ " or subtype, got " ^ (t2str (typecheck
            ctxt e2))))
        | Some (t, Read) -> 
            raise (DoesNotTypecheck ("Set called on read-only field: " ^ s))
        | None -> raise (DoesNotTypecheck ("Missing field in Set: " ^ s)))
    | _ -> raise(DoesNotTypecheck ("Bad record type in Set.  Expected RecordT _, got " ^ (t2str (typecheck ctxt e1)))))
  | Letrec(tRet,sFunName,sArgName,tArg,eBody) -> 
      checkType tRet; checkType tArg;
      if subtype 
         (typecheck ((sArgName, tArg)::((sFunName,ArrowT(tArg,tRet))::ctxt)) eBody) 
         tRet
      then (ArrowT(tArg,tRet))
      else raise (DoesNotTypecheck ("Bad fun body type in Letrec(" ^ sFunName ^
      ").  Expected " ^ (t2str tRet) ^ " or subtype, got " ^
      (t2str (typecheck ((sArgName, tArg)::((sFunName,ArrowT(tArg,tRet))::ctxt)) eBody))))
  | Cast(e,t) -> checkType t; if subtype (typecheck ctxt e) t then t else 
      raise (DoesNotTypecheck ("Bad exp type in cast.  Expected " ^ (t2str t) ^ " or subtype, got " ^ (t2str (typecheck ctxt e))))

let typecheck e = typecheck [] e

(********** examples and testing ***********)

let print_type t = print_string ((t2str t) ^ "\n")

(* #########################################################################
########################################################### *)

(* ################################################################ *)
let lam x t e = Lam(x,t,e)
let app e1 e2 = Apply(e1,e2)
let vx = Var "x"
let vy = Var "y"
let vf = Var "f"

let ex1 = app (lam "x" IntT (Plus(vx, Int(0)))) (Int(1))
let ex1 = lam "x" IntT vx
let ex1 = lam "x" (RecordT[("bar", IntT, Write)]) (RecordE[("foo",vx)])
let ex1 = lam "x" (RecordT[("bar", IntT, Write)]) (RecordE[("foo",vx)])
let ex1 = lam "x" (ArrowT(IntT,IntT)) (RecordE[("foo",vx)])
let ex1 = lam "x" (RecordT[("bar", IntT, Read)])
(RecordE[("foo",vx);("bar",Int(0))])
let ex1 = lam "x" (ArrowT(IntT,IntT)) (Plus(app vx (Int(1)),Int(0)))
let ex1 = app 
           (lam "x" IntT (Plus (vx, Int(2))))
           (app (lam "x" IntT (Plus(vx,Int(23)))) (Int(3)))
let ex1 = Cast(Int(0), RecordE(["name", Int(0)]))
           
let t1 = typecheck ex1
let _ = print_type t1

(* #################################################### *)
(* #############################################################################
##########
############################################################
#################################################
###########################################################

######################
###################

####################################################################
#############

#####################

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

##
###################
#####################################################
#######################################################
#####################################################
#######################################################
##


 *)
