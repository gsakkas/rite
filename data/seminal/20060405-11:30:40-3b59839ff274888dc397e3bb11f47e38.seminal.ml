(*
###########
#################
################
################
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
 | Int(i) -> e
 | Plus(e1,e2)-> 
    let i1 = interp env e1 in
    let i2 = interp env e2 in
    (
        match i1 with
          Int(j) ->
            (
                match i2 with
                  Int(k) ->
                    (
                        Int(j + k)
                    )
                |_ -> raise RuntimeTypeError
            )
        |_ -> raise RuntimeTypeError
    )
 | If(e1,e2,e3) ->
    let i1 = interp env e1 in
    (
        match i1 with
          Int(i) -> if i <> 0 then (interp env e2) else (interp env e3)
        |_ -> raise RuntimeTypeError
    )
 | Pair(e1,e2) -> Pair(interp env e1, interp env e2)
 | First(e1) ->
   (
      match interp env e1 with
        Pair(p1, p2) -> p1
      | _            -> raise RuntimeTypeError
   )
 | Second(e1) ->
   (
      match interp env e1 with
        Pair(p1, p2) -> p2
      | _            -> raise RuntimeTypeError
   )

let interp1 = interp (fun x _ -> x)

(****** Problem 3: complete this function *******)

let rec computeFreeVars e = 
    match e with
      Var(str) -> (e, [str])
    | Lam(str, e1, option) -> 
        (
            let fv = computeFreeVars(e1) in 
            let newList = (remove str (snd fv)) in 
            (Lam (str, (fst fv), Some newList), newList )
        )
    | Closure _ -> raise BadSourceProgram
    | Apply(e1, e2)-> 
        (
            let fv1 = computeFreeVars(e1) in
            let fv2 = computeFreeVars(e2) in
            (Apply((fst fv1),(fst fv2)),  union (snd fv1) (snd fv2))
        )
    | Int(i) -> (e,[])
    | Pair(e1, e2) -> 
        (
            let fv1 = computeFreeVars(e1) in
            let fv2 = computeFreeVars(e2) in
            (Pair((fst fv1),(fst fv2)),  union (snd fv1) (snd fv2))
        )
    | Plus(e1, e2) -> 
        (
            let fv1 = computeFreeVars(e1) in
            let fv2 = computeFreeVars(e2) in
            (Plus((fst fv1),(fst fv2)),  union (snd fv1) (snd fv2))
        )
    | First(e1) -> 
        (
            let fv1 = computeFreeVars(e1) in
            (First((fst fv1)),  snd fv1)
        )
    | Second(e1) -> 
        (
            let fv1 = computeFreeVars(e1) in
            (Second((fst fv1)),  snd fv1)
        )
    | If(e1, e2, e3) -> 
        (
            let fv1 = computeFreeVars(e1) in
            let fv2 = computeFreeVars(e2) in
            let fv3 = computeFreeVars(e3) in
            (If((fst fv1),(fst fv2),(fst fv3)),  union (union (snd fv1) (snd fv2)) (snd fv3))
        )

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
let ans2 = interp1 [] ex2

let ans3 = interp2 [] (fst (computeFreeVars ex1))
let ans4 = interp2 [] (fst (computeFreeVars ex2))

let ans5 = interp3 [] (translate [] ex1)
let ans6 = interp3 [] (translate [] ex2)

let _ = print_string("interp1: ans1: " ^ ans1)

let _ = 
    match ans2 with 
        Int(i) -> print_string ((string_of_int i) ^ "\n")
       |Pair(e1, e2) -> 
          (
          match e1 with 
            Int(i) -> 
            (
              match e2 with 
                Int(j) -> print_string ("pair- i:" ^ (string_of_int i) ^ " j: " ^ (string_of_int j) ^"\n")
              | _ -> print_string "j is not an int"
            )
           | _ -> print_string "i is not an int"
           )
        |_ -> print_string "Don't know what ans1 is"
