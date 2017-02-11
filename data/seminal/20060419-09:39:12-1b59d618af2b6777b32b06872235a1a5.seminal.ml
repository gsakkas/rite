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
let rec type_to_string t =
  match t with
  | IntT -> "Int"
  | ArrowT(t1,t2) -> "(" ^ (type_to_string t1) ^ " -> " ^ (type_to_string t2) ^ ")"
  | RecordT(l) -> 
     let accfun le s = 
       (let (_,typ,_) = le in
        s ^ (type_to_string typ) ^ ",") in
     let acc = List.fold_right accfun l "" in
     "["^ acc ^ "]"

let compareRecWidth l1 l2 = 
  (List.length l1) <= (List.length l2)    

let accessSubType a1 a2 = (* ################################### *)
  match a1,a2 with
  | Read,Read   -> true
  | Read,Both   -> true
  | Write,Write -> true
  | Write,Both  -> true
  | Both,Both   -> true
  | Read,Write  -> false
  | Write,Read  -> false
  | Both,Read   -> false
  | Both,Write  -> false

let isRead a =
  match a with
  | Read -> true
  | Write -> false
  | Both -> true

let isWrite a = 
  match a with 
  | Read -> false
  | Write -> true
  | Both -> true

let raiseRecTypeCheck name err lst =
  raise (DoesNotTypecheck (name ^ err ^ (type_to_string(RecordT(lst)))))
  
let rec subtype t1 t2 = (* ############################# *)
  match t1,t2 with
  | IntT,IntT -> true
  | ArrowT(t11,t12),ArrowT(t21,t22) -> (subtype t21 t11) && (subtype t12 t22)
  | RecordT(l1),RecordT(l2) -> 
      (* ############################ *)
      let compareRecTypes re = 
        let (s,rt1,a1) = re in
        match (getFieldType l1 s) with
        | None -> false
        | Some(rt2,a2) -> (subtype rt1 rt2) && (accessSubType a1 a2)
      in
      let compareWidth = (compareRecWidth l2 l1) in
      let compareTypes = List.for_all compareRecTypes l2 in
      compareWidth && compareTypes
  | _ -> false

(*
########
######################################################
####################################################################################
########################################################################
####################################################################################################
###################################################################################################################
########################################################################################################
######################
*)

let rec typecheck ctxt e = (* ########################### *)
  (* ###################### *)
  match e with
  | Var s -> (try List.assoc s ctxt with Not_found -> raise (DoesNotTypecheck ""))
  | Lam(s,t,e) -> checkType t; ArrowT(t,typecheck ((s,t)::ctxt) e)
  | Closure _ -> raise (DoesNotTypecheck "not a source program")
  | Int _ -> IntT
  | Plus(e1,e2) ->
      if subtype (typecheck ctxt e1) IntT && subtype (typecheck ctxt e2) IntT
      then IntT
      else raise (DoesNotTypecheck "")

  | Apply(e1,e2) -> 
(* ###################### *)
     (let t1 = typecheck ctxt e1 in
      let t2 = typecheck ctxt e2 in
      match t1 with
      | ArrowT(t11,t12) -> 
         if(subtype t2 t11)
         then t12
         else raise (DoesNotTypecheck ("Found "^(type_to_string t2)^" expected "^(type_to_string t11)^" in "^(type_to_string t1)))
      | _ -> raise (DoesNotTypecheck ("Found "^(type_to_string t1)^" expected Function("^(type_to_string t2)^")"))
     ) 
  | If (eIf,eThen,eElse) -> 
print_endline "If";
raise Unimplemented
  | RecordE(lst) -> (* ################# *) 
(* ######################## *)
     let eval le = 
       let (s,e) = le in
       let t = typecheck ctxt e in
       (s,t,Both)
     in
     RecordT(List.map eval lst)
  | RecordV(lst) -> (* ######################### *) (* ################## *) 
print_endline "RecordV";
raise Unimplemented
  | Get(e,s) ->
(* #################### *)
     let t = typecheck ctxt e in
     (match t with
      | RecordT(lst) -> 
         (match (getFieldType lst s) with
          | None -> raiseRecTypeCheck s " is not found in " lst
          | Some(t,a) ->  
             if(isRead(a)) 
             then t 
             else raiseRecTypeCheck s " is not readable in " lst
         )
      | _ -> raise (DoesNotTypecheck("Found "^(type_to_string t)^" expected RecordT"))
     )
  | Set(e1,s,e2) ->
(* #################### *)
     (let t1 = typecheck ctxt e1 in
      let t2 = typecheck ctxt e2 in 
      match t1 with
      | RecordT(lst1) -> 
         (match (getFieldType lst1 s) with
          | None -> raiseRecTypeCheck s " is not found in " lst1
          | Some(rt1,a1) -> 
             if(isWrite(a1))
             then 
               if(subtype rt1 t2)
               then rt1 
               else raise (DoesNotTypecheck("Found "^(type_to_string t2)^" expected " ^ (type_to_string rt1)))
             else raiseRecTypeCheck s " is not writable in " lst1
         )
      | _ -> raise (DoesNotTypecheck("Found "^(type_to_string t1)^" expected RecordT"))
     )
  | Letrec(t1,fs,xs,t2,e) -> 
print_endline "Letrec";
     let te = typecheck ((xs,t2)::(fs,ArrowT(t2,t1))::ctxt) e in
     if(subtype te t2)
     then ArrowT(t2,t1)
     else raise (DoesNotTypecheck("Found "^(type_to_string te)^" expected "^(type_to_string t2) ^" in " ^ (type_to_string (Letrec(t1,fs,xs,t2,e)))))
  | Cast(e,t) -> 
print_endline "Cast";
raise Unimplemented

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
