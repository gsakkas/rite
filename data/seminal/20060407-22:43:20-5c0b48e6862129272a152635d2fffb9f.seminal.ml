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

let ex1 = (Apply(Apply(Lam("x",Lam("y", Plus(Var"x",Var "y"),None),None), 
		      Int 17),
		Int 19))

let rec computeFreeVars e =
      match e with
	Var s -> (Var(s),(add s empty_set))
      | Lam(s, e2, opt) ->
	  let newVars1 = computeFreeVars e2 in
	  let vList1 = snd newVars1 in
	  let newExp1 = fst newVars1 in
	  let newList= remove s vList1 in
	  let finalList = add s vList1 in
	  ((Lam(s,newExp1,Some(newList))),finalList)

      | Apply (exp1, exp2) ->
	  let newVars1 = (computeFreeVars exp1) in
	  let newVars2 = (computeFreeVars exp2) in
	  let vList1 = snd newVars1 in
	  let vList2 = snd newVars2 in
	  let newExp1 = fst newVars1 in
	  let newExp2 = fst newVars2 in
	  ((Apply(newExp1, newExp2)), (union vList1 vList2))
      | Closure(string, exp, env) -> raise BadSourceProgram
      | Int (i) -> ((Int(i)), empty_set)
      | Plus(exp1, exp2) ->
	  let newVars1 = (computeFreeVars exp1) in
	  let newVars2 = (computeFreeVars exp2) in
	  let vList1 = snd newVars1 in
	  let vList2 = snd newVars2 in
	  let newExp1 = fst newVars1 in
	  let newExp2 = fst newVars2 in
	  ((Plus(newExp1,newExp2)), (union vList1 vList2))
      | If (exp1, exp2, exp3) ->
	  let newVars1 = (computeFreeVars exp1) in
	  let newVars2 = (computeFreeVars exp2) in
	  let newVars3 = (computeFreeVars exp3) in
	  let vList1 = snd newVars1 in
	  let vList2 = snd newVars2 in
	  let vList3 = snd newVars3 in
	  let newExp1 = fst newVars1 in
	  let newExp2 = fst newVars2 in
	  let newExp3 = fst newVars3 in
	  ((If(newExp1, newExp2, newExp3)), (union vList1 (union vList2 vList3)))
      | Pair (exp1, exp2) ->
	  let newVars1 = (computeFreeVars exp1) in
	  let newVars2 = (computeFreeVars exp2) in
	  let vList1 = snd newVars1 in
	  let vList2 = snd newVars2 in
	  let newExp1 = fst newVars1 in
	  let newExp2 = fst newVars2 in
	  ((Pair(newExp1, newExp2)), (union vList1 vList2))
      | First (exp1) ->
	  let newVars1 = (computeFreeVars exp1) in
	  let vList1 = snd newVars1 in
	  let newExp1 = fst newVars1 in
	  ((First(newExp1)),  vList1)
      | Second (exp1) ->
	  let newVars1 = (computeFreeVars exp1) in
	  let vList1 = snd newVars1 in
	  let newExp1 = fst newVars1 in
	  ((Second(newExp1)), vList1)

let rec print_array array =
  match array with
    hd::tl -> print_string (hd);print_array tl
  | []->()


let rec printExp e =
  match e with
    Var(s) -> print_string("Var("^s^")")
  | Lam(s,e2, vList) -> 
      (match vList with
	Some(lst) -> print_string ("Lam("^s^","); printExp e2;print_string (","); print_array lst;print_string (")")
      | None->())
  | Apply(exp1,exp2) -> print_string ("Apply(");printExp exp1;print_string (","); printExp exp2;print_string (")")
  | Closure(string, exp1, exp2) -> ()
  | Int (i) -> print_string ("Int("^(string_of_int i)^")")
  | Plus (exp1, exp2) -> print_string ("Plus(");printExp exp1;print_string (","); printExp exp2;print_string (")")
  | If(exp1, exp2, exp3)-> print_string ("If(");printExp exp1; print_string (","); printExp exp2;print_string (","); printExp exp3;print_string (")")
  | Pair (exp1, exp2) ->print_string ("Plus(");printExp exp1;print_string( ","); printExp exp2;print_string( ")")
  | First(exp1) -> print_string ("First(");printExp exp1;print_string (")")
  | Second(exp1)->print_string ("Second(");printExp exp1;print_string( ")")
let _ = print_endline("array : ");
print_array (snd (computeFreeVars ex1)); printExp(fst (computeFreeVars ex1));print_endline("")

let rec printEnv e = 
  match e with
    hd::tl -> let (s,v) = hd in
                 print_endline(s^"=");(printExp e); printEnv tl
  | [] ->()

(******* Problem 2: complete this function *********)
(* ###################################################################
################################################ *)
let rec interp f env e =
  let interp = interp f in
  print_endline ("starting interp");
  match e with
   Var s ->List.assoc s env (* ############# *)
 | Lam(s,e2,opt) -> print_endline ("entering lambda"^s);printExp e2; Closure(s,e2,f env opt) (*store env!*) 
 | Closure _ -> e (* ################### *)
 | Apply(e1,e2) ->
    print_endline("enter apply");
    let v1 = interp env e1 in
    let v2 = interp env e2 in
    (match v1 with
      Closure(s,e3,env2) -> interp((s,v2)::env2) e3
     | _ -> raise RuntimeTypeError)
 | Int(i) -> Int(i)
 | Plus(e1, e2) -> 
     let v1 = interp env e1 in
     let v2 = interp env e2 in
     let o1 = 
       (match v1 with
       Int(i1)-> i1
       | _ -> raise RuntimeTypeError) in
     let o2 =
       (match v2 with
	 Int(i2) ->i2
       | _ -> raise RuntimeTypeError) in
     Int(o1+o2)	 
 | If(e1, e2, e3) ->
     let v1 = interp env e1 in
     (match v1 with
       Int(i) -> 
	 if (i=0) then interp env e3
	 else interp env e2
     | _ -> raise RuntimeTypeError)
 | Pair(e1, e2) -> Pair((interp env e1), (interp env e2))
 | First(e1) -> 
     let v1 = interp env e1 in
     (match v1 with 
       Pair(f, s) -> f
     | _ -> raise RuntimeTypeError)
 | Second(e1) ->
     let v1 = interp env e1 in
     (match v1 with
       Pair(f,s) -> s
     | _ -> raise RuntimeTypeError)

let interp1 = interp (fun x _ -> x)

(****** Problem 3: complete this function *******)


let interp2 = interp (fun (env:env) opt ->
 match opt with
     None -> raise BadPrecomputation
   | Some lst -> List.map (fun s -> print_endline ("looking up "^s);(printEnv env);(s, List.assoc s env)) lst)

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

(*let ans1 = interp1 [] ex1
let ans2 = interp1 [] ex2*)



let ans3 = interp2 [] (fst (computeFreeVars ex1))
(*let ans4 = interp2 [] (fst (computeFreeVars ex2))*)

(*let ans5 = interp3 [] (translate [] ex1)
let ans6 = interp3 [] (translate [] ex2)*)

(*let _ = match ans1 with
  Int(i) -> print_endline(string_of_int i)
|_ -> raise Unimplemented

let _ = match ans2 with
  Int(i) -> print_endline(string_of_int i)
|_ -> raise Unimplemented*)

(*let _ = match ans3 with
  Int(i) -> print_endline(string_of_int i)
|_ -> raise Unimplemented

let _ = match ans4 with
  Int(i) -> print_endline(string_of_int i)
|_ -> raise Unimplemented*)
