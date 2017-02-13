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
  | First (Pair (e1,e2)) -> e1
  | First _ -> raise RuntimeTypeError
  | Second (Pair (e1,e2)) -> e2
  | Second _ -> raise RuntimeTypeError 

let interp1 = interp (fun x _ -> x)

(****** Problem 3: complete this function *******)

let printenv e = 
   print_endline 
   ( 
    match e with
    | Var s -> ("Var "^s)
    | Lam(s,e,lst) -> ("Lam "^s^
       match lst with
       | None -> "Empty"
       | Some l -> string_of_int(List.length l)
      )
    | Apply(e1,e2) -> "Apply"
    | Closure(s,e1,e2) -> "Closure"
    | Int i -> "Int "^(string_of_int i)
    | Plus(e1,e2) -> "Plus"
    | If(e1,e2,e3) -> "If"
    | Pair(e1,e2) -> "Pair"
    | First(e) -> "First"
    | Second(e) -> "Second"
   )

let rec computeFreeVars e = 
  let _ = printenv e
  in	
  match e with
  | Var s -> ((Var s), ([s]))
  | Lam(s,e,lst) -> 
     let (en,l) = computeFreeVars e in
     (Lam(s,en,Some l),l)
  | Apply(e1,e2) -> 
     let (en1,l1) = computeFreeVars e1 in
     let (en2,l2) = computeFreeVars e2 in
     ((Apply(en1,en2)),(union l1 l2))
  | Closure(s,e1,e2) -> raise BadSourceProgram
  | Int i -> ((Int i),[])
  | Plus(e1,e2) ->
     let (en1,l1) = computeFreeVars e1 in
     let (en2,l2) = computeFreeVars e2 in
     ((Plus(en1,en2)),(union l1 l2))
  | If(e1,e2,e3) ->
     let (en1,l1) = computeFreeVars e1 in
     let (en2,l2) = computeFreeVars e2 in
     let (en3,l3) = computeFreeVars e3 in
     ((If(en1,en2,en3)),(union l1 (union l2 l3)))
  | Pair(e1,e2) ->
     let (en1,l1) = computeFreeVars e1 in
     let (en2,l2) = computeFreeVars e2 in
     ((Pair(en1,en2)),(union l1 l2))
  | First e -> computeFreeVars e
  | Second e -> computeFreeVars e

let interp2 = interp (fun (env:env) opt ->
  match opt with
  | None -> raise BadPrecomputation
  | Some lst -> List.map (fun s -> (s, List.assoc s env)) lst)

let testinterp = interp (fun (env:env) opt ->
  match opt with
  | None -> raise BadPrecomputation
  | Some lst -> 
 (
  (
   List.iter print_endline lst
  );
  (List.map 
   (fun s -> 
    (
     (
      let _ = match env with
        | (s,e) -> printenv e
        | _ -> print_endline "unknown"
      in
      print_endline s
     );(s, List.assoc s env))
   ) lst)
  )
 )

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
let ex1 = (
           Apply(
            Apply(
             Lam("x",
              Lam("y",Plus(Var"x",Var"y"),None),
              None
             ), 
             Int 17
            ),
            Int 19
           )
          )

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

let _ = testinterp [] (fst (computeFreeVars ex1))

(*
#################################################
#################################################
*)

(*
########################################
########################################
*)
