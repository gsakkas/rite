
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Mirana of expr
  | Darius of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Mirana e -> abs_float (eval (e, x, y))
  | Darius (e1,e2,e3) ->
      mod_float ((eval (e1, x, y)) +. (eval (e2, x, y))) eval (e3, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Mirana of expr
  | Darius of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Mirana e -> abs_float (eval (e, x, y))
  | Darius (e1,e2,e3) ->
      let comb = (eval (e1, x, y)) +. (eval (e2, x, y)) in
      mod_float comb (eval (e3, x, y));;

*)

(* changed spans
(29,6)-(29,15)
let comb =
  eval (e1 , x , y) +. eval (e2 , x , y) in
mod_float comb
          (eval (e3 , x , y))
LetG NonRec (fromList [BopG EmptyG EmptyG]) (AppG (fromList [EmptyG]))

(29,57)-(29,61)
mod_float
VarG

(29,57)-(29,61)
comb
VarG

(29,57)-(29,61)
mod_float comb
          (eval (e3 , x , y))
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(29,57)-(29,61)
eval (e3 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

*)
