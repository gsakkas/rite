
(* 
####################################################################
################
###############
###############
##
####################################################################
 *)
 
 
(****** Note: Problem 1 does not use Caml; see the assignment *****)
(* ###################################################### *)

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

(* ######################################################### *)

let printlist lst = List.map (fun s -> print_string (s ^ " ")) lst 
let test_out s lst = print_string ("List for Lam " ^ s ^": "); printlist lst; print_endline ("")
let test_env s lst = print_string ("Env for " ^ s ^": ");printlist lst; print_endline ("")


(******* Problem 2: complete this function *********)
(* ###################################################################
################################################ *)
let rec interp f env e =
  let interp = interp f in
  match e with
   Var s -> 
   	    List.assoc s env (* ############# *)
 | Lam(s,e2,opt) -> 
 	test_env ("Lam "^s) env;
  	    (match opt with
  	       None -> print_endline("Lam " ^ s ^ ": Null opt")
 	     | Some lst -> test_out s lst);
	Closure(s,e2,f env opt) (*store env!*) 
	
 | Closure _ -> e (* ################### *)
 
 | Apply(e1,e2) ->
    let v1 = interp env e1 in
    let v2 = interp env e2 in
    (match v1 with
      Closure(s,e3,env2) -> interp((s,v2)::env2) e3
     | _ -> raise RuntimeTypeError)
     
   (* ############################ *)
 | Int i -> e
 
   (* #####################################################
######################################### *)
 | Plus(e1,e2) -> 
    let v1 = interp env e1 in
    let v2 = interp env e2 in
    (match v1 with
      Int i -> 
        (match v2 with 
          Int j -> Int(i + j)
        | _ -> raise RuntimeTypeError)
    | _ -> raise RuntimeTypeError  )
   
   (* ########################################################
############################################### *)
 | If(e_if,e_then,e_else) ->
    let v_if = interp env e_if in
      (match v_if with
         Int i -> 
           if (i <> 0) then interp env e_then
           else interp env e_else
       | _ -> raise RuntimeTypeError)

    (* #########################################################
####################################################### *)
  | Pair(e1,e2)->
    let v1 = interp env e1 in
    let v2 = interp env e2 in
    Pair(v1,v2)
   
   (* #########################################################
#################################################### *)
 | First ef -> let v = interp env ef in
   (match v with 
      Pair(v1,v2)->v1
    | _ -> raise RuntimeTypeError)
   
   (* ################### *)
 | Second es -> let v = interp env es in
   (match v with 
      Pair(v1,v2)-> v2
    | _ -> raise RuntimeTypeError)


let interp1 = interp (fun x _ -> x)

(****** Problem 3: complete this function *******)

let rec computeFreeVars e = 
  match e with
    Var s -> (e,[s])
    
    (* ###############################################################
###################################################################
########################## *)
  | Lam(s,e2,opt) -> 
  	let (e1,lst) = (computeFreeVars e2) in
  	let lst_adj = remove s lst in
  	(match opt with
  	  None -> (Lam (s,e1, Some(lst_adj)), lst_adj)
  	| Some in_list -> (Lam(s,e1, Some(union lst_adj in_list)),union lst_adj in_list) )

    (* #############################################################
######################### *)
  | Closure _ -> raise BadSourceProgram
  
    (* ###############################################################
######################################################################
########################################################################
######################### *)
  | Apply(e1,e2) -> 
  	let (exp1,lst1) = computeFreeVars e1 in
  	let (exp2,lst2) = computeFreeVars e2 in
  	(Apply(exp1,exp2),union lst1 lst2)
  	
    (* ############################### *) 	
  | Int i -> (e,empty_set)
 
    (* ########################################################### *)
  | Plus(e1,e2) -> 
  	let (exp1,lst1) = computeFreeVars e1 in
  	let (exp2,lst2) = computeFreeVars e2 in
  	(Plus(exp1,exp2), union lst1 lst2)
  	
    (* ################################################################
############################################################# *)
  | If(e1,e2,e3) -> 
  	let (if_exp, if_lst) = computeFreeVars e1 in
  	let (then_exp,then_lst) = computeFreeVars e2 in
  	let (else_exp, else_lst) = computeFreeVars e3 in
  	(If(if_exp,then_exp,else_exp), (union (union if_lst then_lst) else_lst))
  
   (* ######################### *)
  | Pair(e1,e2) -> 
  	let (exp1,lst1) = computeFreeVars e1 in
  	let (exp2,lst2) = computeFreeVars e2 in
  	(Pair(exp1,exp2), union lst1 lst2)
  
    (* #####################################################################
##########################################################################
############################################# *)
  | First ef -> 
  	let (e1,lst1) = computeFreeVars ef in
  	(First e1, lst1)
     
    (* ################ *) 
  | Second es -> 
  	let (e2,lst2) = computeFreeVars es in
  	(Second e2, lst2)

let interp2 = interp (fun (env:env) opt ->
  match opt with
     None -> raise BadPrecomputation
   | Some lst -> List.map (fun s -> (s, List.assoc s env)) lst)
   

(******* Problem 4: not programming (see assignment) ********)
(* ######################################################## *)

(******* Problem 5a: explain this function *********)
(* ######################################################## *)

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


(* ################################# *)

let p1 = Pair(Int 7, Plus(Int 4, Int 6))
let p2 = Pair(Pair(Int 1, Int 2), Pair(Int 3, Int 4))
let p3 = Pair(Pair(Pair(Int 100, Int 101), Pair(Int 200, Int 201)),
	      Pair(Pair(Int 300, Int 301), Pair(Int 400, Int 401)) )

let ex_p1 = (Apply(Apply(Lam("x",Lam("y",Plus(Var"x",Var"y"),None),None),
		(First p1)), (Second p1)
		))

let ex_p2 = (Apply(Apply(Lam("x",Lam("y",Plus(Var"x",Var"y"),None),None),
		(First (Second p2))), (Second (First p2))
		))
		
let ex_p3 = (Apply(Apply(Lam("x",Lam("y",Plus(Var"x",Var"y"),None),None),
		(First (First (First p3)))), (Second (Second (Second p3)))
		))
		
let ex_pvar =  (Apply(Lam("p", Plus (First (Var "p"),Int 1),None) ,
         (Pair(Int 4,Int 5))) )
   
(* ################################################################
############ *)
 
let str_ex1 = "exp = (Apply(Apply(Lam(\"x\",Lam(\"y\", Plus(Var\"x\",Var \"y\"),None),None), 
		      Int 17), Int 19))"
		
let str_ex2 = "exp = (app (app fix sum) (Int 1000))"
   
let str_ex_p1 = "p1 = Pair(Int 7, Plus(Int 4, Int 6)) and\n" ^
		"exp = (Apply(Apply(Lam(\"x\",Lam(\"y\",Plus(Var\"x\",Var\"y\"),None),None),
		(First p1)), (Second p1)  ))"
		
let str_ex_p2 = "p2 = Pair(Pair(Int 1, Int 2), Pair(Int 3, Int 4)) and\n" ^
	      "exp = (Apply(Apply(Lam(\"x\",Lam(\"y\",Plus(Var\"x\",Var\"y\"),None),None),
		(First (Second p2))), (Second (First p2)) ))"

let str_ex_p3 = "p3 = Pair(Pair(Pair(Int 100, Int 101), Pair(Int 200, Int 201)),
	      Pair(Pair(Int 300, Int 301), Pair(Int 400, Int 401)) )  and\n" ^
		"exp = (Apply(Apply(Lam(\"x\",Lam(\"y\",Plus(Var\"x\",Var\"y\"),None),None),
		(First (First (First p3)))), (Second (Second (Second p3))) ))"
		
let str_ex_pvar = "exp = (Apply(Lam(\"p\", Plus (First (Var \"p\"),Int 1),None) ,
         (Pair(Int 4,Int 5))) )"


(* ############################################################
########################################################
#################### *)

(* ############################################# *)
let print_value ans = print_endline ("Value = " ^ 
		(match ans with 
		  Int i -> string_of_int i
		 | _ -> "undefined"))
	
(* #################################################################### *)
let print_exp str= print_endline("\n-------------------------------------------"^
				"----------------\n\n" ^ str)


(* ############################################################ *)
let test_interp1 e str =
print_exp str;
let ans = interp1 [] e in
print_value ans


(* ############################################################ *)
let test_interp2 e str= 
print_exp str;
let (e1, lst1) = computeFreeVars e in
let ans = interp2 [] e1 in
print_value ans


(* ############################################################ *)
let test_interp3 e str =
print_exp str;
let e1 = translate [] e in
let ans = interp3 [] e1 in
print_value ans

(* ####################################################################
###### *)
let test_all fnc i =
   print_endline("\n*******************INTERP"^(string_of_int i)^"*******************");
   fnc ex1 str_ex1;
   fnc ex2 str_ex2;
   fnc ex_p1 str_ex_p1; 
   fnc ex_p2 str_ex_p2;
   fnc ex_p3 str_ex_p3;
   fnc ex_pvar str_ex_pvar

(* ############## *)
(* #####################
###############################
###############################
###############################
*)

(* #######################################################################
########################################################################
############## *)
(* #####################
#######################################################################
#######################
#################################
*)	


(* ##############################################################
###################### *)
let ans1 = interp1 [] ex1
let ans2 = interp1 [] ex2
let ans3 = interp2 [] (fst (computeFreeVars ex1))
let ans4 = interp2 [] (fst (computeFreeVars ex2))
let ans5 = interp3 [] (translate [] ex1)
let ans6 = interp3 [] (translate [] ex2)

(* #####################
########################
########################
########################
########################
########################
########################
*)