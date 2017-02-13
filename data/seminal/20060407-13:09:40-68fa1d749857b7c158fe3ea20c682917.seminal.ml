
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
  let interp = interp f in
  match e with
   Var s -> 
   	    List.assoc s env (* ############# *)
 | Lam(s,e2,opt) -> 
 	    Closure(s,e2,f env opt) (*store env!*) 
 | Closure _ -> e (* ################### *)
 | Apply(e1,e2) ->
    let v1 = interp env e1 in
    let v2 = interp env e2 in
    (match v1 with
      Closure(s,e3,env2) -> interp((s,v2)::env2) e3
     | _ -> raise RuntimeTypeError)
 | Int i -> e
 | Plus(e1,e2) -> 
    let v1 = interp env e1 in
    let v2 = interp env e2 in
    (match v1 with
      Int i -> 
        (match v2 with 
          Int j -> Int(i + j)
        | _ -> raise RuntimeTypeError)
    | _ -> raise RuntimeTypeError  )
 | If(e_if,e_then,e_else) ->
    let v_if = interp env e_if in
      (match v_if with
         Int i -> 
           if (i <> 0) then interp env e_then
           else interp env e_else
       | _ -> raise RuntimeTypeError)
  (* ###############################################
#########################################################
##########################
################################### *)
  | Pair(e1,e2)->
    let v1 = interp env e1 in
    let v2 = interp env e2 in
    Pair(v1,v2)
   
 | First e -> let v = interp env e in
   (match v with 
      Pair(e1,e2)->interp env e1
    | _ -> raise RuntimeTypeError)
 | Second e -> let v = interp env e in
   (match v with 
      Pair(e1,e2)-> interp env e2
    | _ -> raise RuntimeTypeError)


let interp1 = interp (fun x _ -> x)

(****** Problem 3: complete this function *******)

(* ####### *)
let printlist lst = List.map (fun s -> print_string (s ^ " ")) lst
let test_lst = ["hi";"my";"name";"is";"oliver"]
let test_out s lst = print_string ("List for Lam " ^ s ^": "); printlist lst; print_endline ("")
let _ = test_out "test" test_lst

let rec computeFreeVars e = 
  match e with
    Var s -> print_endline("Var " ^ s);(e,empty_set)
  | Lam(s,e2,opt) -> 
  	print_endline("Lam " ^ s);
  	let (e1,lst) = (computeFreeVars e2) in
  	let test = (test_out s lst) in 
  	(e1, union (add s lst) opt)
  	(* #################################### *)
  | Closure _ -> print_endline("Closure");raise BadSourceProgram
  | Apply(e1,e2) -> print_endline("Apply");
  	let (exp1,lst1) = computeFreeVars e1 in
  	let (exp2,lst2) = computeFreeVars e2 in
  	(Apply(exp1,exp2),union lst1 lst2)
  | Int i -> print_endline("Int " ^ string_of_int i);(e,empty_set)
  | Plus(e1,e2) -> print_endline("Plus");
  	let (exp1,lst1) = computeFreeVars e1 in
  	let (exp2,lst2) = computeFreeVars e2 in
  	(Plus(exp1,exp2), union lst1 lst2)
  | If(e1,e2,e3) -> print_endline("If");(e, union (union (snd (computeFreeVars e1))
  				     (snd (computeFreeVars e2)) )
  			      (snd (computeFreeVars e3)))
  | Pair(e1,e2) -> print_endline("Pair");(e, union (snd (computeFreeVars e1)) (snd (computeFreeVars e2)))
  | First e -> print_endline("First");(match e with
       Pair(e1,e2) -> (e,snd (computeFreeVars e1))
     | _ -> raise BadSourceProgram)
  | Second e -> print_endline("Second");(match e with
       Pair(e1,e2) -> (e,(snd (computeFreeVars e2)))
     | _ -> raise BadSourceProgram)

let interp2 = interp (fun (env:env) opt ->
  match opt with
     None -> raise BadPrecomputation
   | Some lst -> List.map (fun s -> (s, List.assoc s env)) lst)
   

(******* Problem 4: not programming (see assignment) ********)

(******* Problem 5a: explain this function *********)

let interp3 = interp (fun (env:env) _ -> [])

(****** Problem 5b (EXTRA CREDIT): explain the next two functions ******)

let rec depthToExp s varlist exp =
   match varlist with
    [] -> raise BadSourceProgram
  | hd::tl -> if s=hd then First exp else depthToExp s tl (Second exp)
   
let rec translate varlist exp = 
   match exp with
   Var s -> depthToExp s varlist (Var "arg")
 | Lam(s,e2,_) -> Pair(Lam("arg",translate (s::varlist) e2, None), 
                       match varlist with [] -> Int 0 | _ -> Var "arg")
 | Closure _ -> raise BadSourceProgram
 | Apply(e1,e2) -> 
   let e1' = translate varlist e1 in
   let e2' = translate varlist e2 in
   (* ############################################# *)
   Apply(Lam("f",Apply(First(First(Var "f")), 
                       Pair(Second(Var "f"),Second(First(Var "f")))),None),
         Pair(e1',e2'))
 | Int _ -> exp
 | Pair(e1,e2) -> Pair(translate varlist e1, translate varlist e2)
 | Plus(e1,e2) -> Plus(translate varlist e1, translate varlist e2)
 | First(e1) -> First(translate varlist e1)
 | Second(e1) -> Second(translate varlist e1)
 | If(e1,e2,e3) -> If(translate varlist e1,
                      translate varlist e2,
                      translate varlist e3)

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

(* ########################################################### *)

let ans1 = interp1 [] ex1

let _ = print_endline ("Final value: " ^ 
		(match ans1 with 
		  Int i -> string_of_int i
		 | _ -> "undefined"))


let ans2 = interp1 [] ex2

let _ = print_endline ("Final value: " ^ 
		(match ans2 with 
		  Int i -> string_of_int i
		 | _ -> "undefined"))

let p1 = Pair(Int 7, Plus(Int 4, Int 6))
let p2 = Pair(Pair(Int 1, Int 2), Pair(Int 3, Int 4))
let p3 = Pair(Pair(Pair(Int 100, Int 101), Pair(Int 200, Int 201)),
	      Pair(Pair(Int 300, Int 301), Pair(Int 400, Int 401)) )

let ex3 = (Apply(Apply(Lam("x",Lam("y",Plus(Var"x",Var"y"),None),None),
		(First (Second p2))), (Second (First p2))
		))

let ex3 = (Apply(Apply(Lam("x",Lam("y",Plus(Var"x",Var"y"),None),None),
		(First p1)), (Second p1)
		))
		
let ex3 = (Apply(Apply(Lam("x",Lam("y",Plus(Var"x",Var"y"),None),None),
		(First (First (First p3)))), (Second (Second (Second p3)))
		))

let ans3 = interp1 [] ex3

let print_final ans = print_endline ("Final value: " ^ 
		(match ans with 
		  Int i -> string_of_int i
		 | _ -> "undefined"))

let _ = print_final ans3

let test e = 
let (e1, lst1) = computeFreeVars e in
let out= test_out "ex1 final" lst1 in
let ans = interp2 [] e1 in
print_final ans

let _ = test ex1



(*
#################################################
#################################################

########################################
########################################
*)