(****** Note: Problem 1 does not use Caml; see the assignment *****)

exception Unimplemented
exception RuntimeTypeError
exception BadSourceProgram
exception BadPrecomputation

(* ############################################################### *)
(* ######################################## *)
let empty_set = []
let add str lst = if List.mem str lst then lst else str::lst
let remove str lst = List.filter (fun x -> x <> str) lst
let rec union lst1 lst2 = 
   match lst1 with
     [] -> lst2
   | hd::tl -> add hd (union tl lst2)

(* ################################################ *)
type exp = Var of string 
         | Lam of string * exp * (string list option)(*last part for problem3*)
         | Apply of exp * exp
         | Closure of string * exp * env
	 | Int of int
	 | Plus of exp * exp
	 | If of exp * exp * exp
	 | Pair of exp * exp
	 | First of exp
	 | Second of exp

and env = (string * exp) list

(******* Problem 2: complete this function *********)
(* ###################################################################
################################################ *)
let rec interp f env e =
  let etoint e = 
    match e with
    | Int i -> i
    | _ -> raise RuntimeTypeError 
  in
  let interp = interp f in
  match e with
  | Var s -> List.assoc s env (* ############# *)
  | Lam(s,e2,opt) -> Closure(s,e2,f env opt) (*store env!*) 
  | Closure _ -> e (* ################### *)
  | Apply(e1,e2) ->
     let v1 = interp env e1 in
     let v2 = interp env e2 in
     (match v1 with
      |  Closure(s,e3,env2) -> interp((s,v2)::env2) e3
      | _ -> raise RuntimeTypeError)
  | Int i -> Int i
  | Plus (e1,e2) -> 
     let i1 = etoint(interp env e1) in
     let i2 = etoint(interp env e2) in
       Int (i1 + i2)
  | If (e1,e2,e3) -> 
     let i = etoint(interp env e1) in
     (match i with 
      | 0 -> interp env e3
      | _ -> interp env e2)
  | Pair (e1, e2) -> Pair((interp env e1),(interp env e2))
  | First (e) -> 
     (match e with
     | Pair(e1,e2) -> e1
     | _ -> raise RuntimeTypeError)
  | Second (e) -> 
     (match e with
     | Pair(e1,e2) -> e2
     | _ -> raise RuntimeTypeError)

let interp1 = interp (fun x _ -> x)

(****** Problem 3: complete this function *******)

let rec computeFreeVars e = 
  match e with
  | Var s ->
     raise Unimplemented
  | Lam(s,e,lst) ->
     Some lst     
  | Apply(e1,e2) ->
     raise Unimplemented
  | Closure(s,e1,e2) ->
     raise BadSourceProgram
  | Int i ->
     raise Unimplemented
  | Plus(e1,e2) ->
     raise Unimplemented
  | If(e1,e2,e3) ->
     raise Unimplemented
(*
####################################
####################################
####################################
##############################
###########################################
########################################################
######
*)
  | Pair(e1,e2) ->
     raise Unimplemented
  | First e ->
     raise Unimplemented
  | Second e ->
     raise Unimplemented


let interp2 = interp (fun (env:env) opt ->
  match opt with
     None -> raise BadPrecomputation
   | Some lst -> List.map (fun s -> (s, List.assoc s env)) lst)

(******* Problem 4: not programming (see assignment) ********)

(******* Problem 5a: explain this function *********)

(*
############################################
*)

(****** Problem 5b (EXTRA CREDIT): explain the next two functions ******)

(*
##################################
#####################
################################
######################################################################
###
################################
#################
############################################
###################################################################
#######################################################################
######################################
###################
####################################
####################################
######################################################
##############################################
###########################################################################
#######################
###############
##################################################################
##################################################################
###########################################
#############################################
###########################################
###########################################
###########################################
*)

(********** examples and testing ***********)

(* ################################
#############################
###########################################################
############################################
 *)

(* ##################################################### *)
let ex1 = (Apply(Apply(Lam("x",Lam("y", Plus(Var"x",Var "y"),None),None), 
		      Int 17),
		Int 19))

(* #####################################################################
################################# *)

(* ################################################################### *)
let lam x e = Lam(x,e,None)
let app e1 e2 = Apply(e1,e2)
let vx = Var "x"
let vy = Var "y"
let vf = Var "f"

(* ########################### *)
let fix = 
   let e = lam "x" (app vf (lam "y" (app (app vx vx) vy))) in
   lam "f" (app e e)

(* ################################################ *)
let sum = 
  lam "f" (lam "x" (If(vx,
		       Plus(vx, app vf (Plus(vx, Int (-1)))),
		       Int 0)))

(* ############################################################### *)
let ex2 = (app (app fix sum) (Int 1000))

let printans ans = 
  match ans with
  | Int i -> print_endline (string_of_int i)
  | _ -> print_endline "error"

(* ########################################################### *)

let ans1 = interp1 [] ex1
let ans2 = interp1 [] ex2

let _ = printans ans1
let _ = printans ans2

let ans3 = interp2 [] (fst (computeFreeVars ex1))
let ans4 = interp2 [] (fst (computeFreeVars ex2))
(*
########################################
########################################
*)
