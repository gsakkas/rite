
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Tan of expr
  | NegPos of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) when (eval (e1, x, y)) < (eval (e2, x, y)) ->
      eval (e3, x, y)
  | Thresh (e1,e2,e3,e4) -> eval (e4, x, y)
  | Tan e1 -> tan (pi *. (eval (e1, x, y)))
  | NegPos (e1,e2,e3) when (eval (e1, x, y)) < (eval (e2, x, y)) ->
      - (eval (e3, x, y))
  | NegPos (e1,e2,e3) -> eval (e3, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Tan of expr
  | NegPos of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) when (eval (e1, x, y)) < (eval (e2, x, y)) ->
      eval (e3, x, y)
  | Thresh (e1,e2,e3,e4) -> eval (e4, x, y)
  | Tan e1 -> tan (pi *. (eval (e1, x, y)))
  | NegPos (e1,e2,e3) when (eval (e1, x, y)) < (eval (e2, x, y)) ->
      -. (eval (e3, x, y))
  | NegPos (e1,e2,e3) -> eval (e3, x, y);;

*)

(* changed spans
(28,7)-(28,26)
(-. eval (e3 , x , y))
UopG (AppG [EmptyG])

*)

(* type error slice
(19,20)-(19,45)
(19,27)-(19,44)
(19,28)-(19,32)
(28,7)-(28,26)
(28,9)-(28,26)
(28,10)-(28,14)
*)
