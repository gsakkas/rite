
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
     (IntT, IntT) -> print_endline ("In subtype: IntT types"); true
   | (ArrowT(t1_arg, t1_body),ArrowT(t2_arg,t2_body)) ->
   	if ((subtype t2_arg t1_arg) && (subtype t1_body t2_body))
   	then (print_endline "In subtype: ArrowT types pass"; true)
   	else (print_endline "In subtype: ArrowT types fail"; false)
   | (RecordT t1_lst,RecordT t2_lst)->
   	print_endline "In subtype: RecordT types";
   	let isSubtype (t1_name, t1_type, t1_access) =
   	  match getFieldType t2_lst t1_name with
   	    None -> false
   	  | Some(t2_type, t2_access) ->
   	    if ((subtype t1_type t2_type) &&
   	        (t1_access = t2_access) || (t1_access = Both))
   	    then true
   	    else false  in
   	List.for_all isSubtype t1_lst 
   | _ -> print_endline ("In Subtype");false

let rec typecheck ctxt e = (* ########################### *)
  (* ###################### *)
  match e with
    Var s -> print_endline ("TC Var " ^ s);
    	(try List.assoc s ctxt with Not_found -> raise (DoesNotTypecheck ""))
  | Lam(s,t,e) -> print_endline("TC Lam " ^ s);
  	checkType t; ArrowT(t,typecheck ((s,t)::ctxt) e)
  | Closure _ -> print_endline ("TC Closure");
  	raise (DoesNotTypecheck "not a source program")
  (* ############### *)
  | Int i -> print_endline ("TC Int " ^ (string_of_int i)); IntT
  | Plus(e1,e2) ->
  	print_endline("TC Plus");
      if subtype (typecheck ctxt e1) IntT && subtype (typecheck ctxt e2) IntT
      then IntT
      else raise (DoesNotTypecheck "")
  | Apply(e1,e2) -> print_endline ("TC Apply");
      let pass_in = typecheck ctxt e2 in
      let expect = typecheck ctxt e1 in
      (match expect with
         ArrowT(t1_arg,t1_body) -> 
         	if (subtype pass_in t1_arg) then t1_body
         	else raise (DoesNotTypecheck "App arg is not a subtype of what fnc expects")
       | _ -> raise (DoesNotTypecheck "App arg is not a Lam"))
   | If(e1,e2,e3)-> print_endline ("TC If");
      if (subtype (typecheck ctxt e1) IntT)
      then 
      ( let e2_type = typecheck ctxt e2 in
        let e3_type = typecheck ctxt e3 in
      	if (subtype e2_type e3_type) 
      	  then e3_type
      	  else (if (subtype e3 e2) 
      	  	then e2_type
      	    	else (raise (DoesNotTypecheck "If e2 and e3 are not sub/supertypes"))
      	       )
      )
      else raise (DoesNotTypecheck "If e1 is not subtype of IntT")
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

###################
##########################################################



######################
####################


#############################################################################
##
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
##
#####################################################
#######################################################
#####################################################
#######################################################
##
 *)
