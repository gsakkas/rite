(* ########
#######
#################
#######
 *)

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
   Var s -> List.assoc s env (* ############# *)
 | Lam(s,e2,opt) -> Closure(s,e2,f env opt) (*store env!*) 
 | Closure _ -> e (* ################### *)
 | Apply(e1,e2) ->
    let v1 = interp env e1 in
    let v2 = interp env e2 in
    (match v1 with
      Closure(s,e3,env2) -> interp((s,v2)::env2) e3
     | _ -> raise RuntimeTypeError)
 | Int _ -> e (* ############################ *)
 | Plus(e1, e2) ->
     let v1 = interp env e1 in
     let v2 = interp env e2 in
     Int((match v1 with
       Int i -> i
     | _ -> raise RuntimeTypeError) +
         (match v2 with
       Int i -> i
     | _ -> raise RuntimeTypeError))
 | If(expTest, expTrue, expFalse) -> 
     let valTest = interp env expTest in
     (match valTest with
       Int i -> if (0 = i) then interp env expFalse else interp env expTrue
     | _ -> raise RuntimeTypeError)
 | Pair(e1,e2) -> 
     let v1 = interp env e1 in
     let v2 = interp env e2 in
     Pair(v1, v2) (* ########################## *)
 | First e -> 
     let v = interp env e in
     (match e with
       Pair(v1, _) -> v1
     | _ -> raise RuntimeTypeError)
 | Second e ->
     let v = interp env e in
     (match e with
       Pair(_, v2) -> v2
     | _ -> raise RuntimeTypeError)
     
let interp1 = interp (fun x _ -> x)

(****** Problem 3: complete this function *******)

let rec computeFreeVars e = 
  match e with
   Var s -> (Var s, add s empty_set)
 | Lam(s,e2,opt) -> 
     let (processedExp, lst) = computeFreeVars e2 in
     (Lam(s, processedExp, Some (remove s lst)), (remove s lst))
 | Closure _ -> raise BadSourceProgram
 | Apply(e1,e2) -> 
     let (processedExp1, lst1) = computeFreeVars e1 in
     let (processedExp2, lst2) = computeFreeVars e2 in
     (Apply(processedExp1, processedExp2), union lst1 lst2)
 | Int _ -> (e, empty_set)
 | Plus(e1, e2) ->
     let (processedExp1, lst1) = computeFreeVars e1 in
     let (processedExp2, lst2) = computeFreeVars e2 in
     (Plus(processedExp1, processedExp2), (union lst1 lst2))
 | If(expTest, expTrue, expFalse) -> 
     let (processedTest, lst1) = computeFreeVars expTest in
     let (processedTrue, lst2) = computeFreeVars expTrue in
     let (processedFalse, lst3) = computeFreeVars expFalse in
     (If(processedTest, processedTrue, processedFalse), union (union lst1 lst2)
     lst3)
 | Pair(e1,e2) -> 
     let (processedExp1, lst1) = computeFreeVars e1 in
     let (processedExp2, lst2) = computeFreeVars e2 in
     (Pair(processedExp1, processedExp2), union lst1 lst2)
 | First(e) -> 
     let (processedExp, lst) = computeFreeVars e in
     (First(processedExp), lst)
 | Second(e) -> 
     let (processedExp, lst) = computeFreeVars e in
     (Second(processedExp), lst)

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

let print_prog exp =
  let make_string_indent i s =
    (String.make i " ") ^ s ^ "\n" in
  let pphelper exp indent =
    match exp with
      Var s -> make_string_indent indent ("Var" ^ s)
    | Lam(s, e, opt) -> 
        let expStr = pphelper e (indent+2) in
        (make_string_indent indent "Lam(") ^ 
        expStr ^ 
        (make_string_indent (indent+2) opt2Str) ^
        (make_string_indent indent ")")
    | Closure _ -> raise BadSourceProgram
    | Apply(e1, e2) ->
        let s1 = pphelper e1 (indent + 2) in
        let s2 = pphelper e2 (indent + 2) in
        (make_string_indent indent "Apply(") ^ 
        s1 ^ 
        s2 ^
        (make_string_indent indent ")")
    | Int i -> make_string_indent indent ("Int" ^ (string_of_int i))
    | Pair(e1, e2) ->
        let s1 = pphelper e1 (indent + 2) in
        let s2 = pphelper e2 (indent + 2) in
        (make_string_indent indent "Pair(") ^ 
        s1 ^ 
        s2 ^
        (make_string_indent indent ")")
    | Plus(e1, e2) ->
        let s1 = pphelper e1 (indent + 2) in
        let s2 = pphelper e2 (indent + 2) in
        (make_string_indent indent "Plus(") ^ 
        s1 ^ 
        s2 ^
        (make_string_indent indent ")")
    | First e ->
        let s = pphelper e (indent + 2) in
        (make_string_indent indent "First(") ^ 
        s ^ 
        (make_string_indent indent ")")
    | Second e ->
        let s = pphelper e (indent + 2) in
        (make_string_indent indent "Second(") ^ 
        s ^ 
        (make_string_indent indent ")")
    | If(e1, e2, e3) ->
        let s1 = pphelper e1 (indent + 2) in
        let s2 = pphelper e2 (indent + 2) in
        let s3 = pphelper e3 (indent + 2) in
        (make_string_indent indent "If(") ^ 
        s1 ^ 
        s2 ^
        s3 ^
        (make_string_indent indent ")") in
  pphelper exp 0

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

let print_my_int i = 
  let _ = match i with
    Int i -> print_int i
  | _ -> failwith "Not an int result" in
  print_string "\n"

let ans1 = interp1 [] ex1

let _ = print_my_int ans1

let ans2 = interp1 [] ex2

let _ = print_my_int ans2

let ans3 = interp2 [] (fst (computeFreeVars ex1))

let _ = print_my_int ans3

let ans4 = interp2 [] (fst (computeFreeVars ex2))

let _ = print_my_int ans4

let ans5 = interp3 [] (translate [] ex1)
let ans6 = interp3 [] (translate [] ex2)
