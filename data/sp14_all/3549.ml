
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewExprA of expr* expr
  | NewExprB of expr* expr* expr;;

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
  | NewExprA (e1,e2) ->
      if (eval (e1, x, y)) > (eval (e2, x, y))
      then eval (e1, x, y)
      else eval (e2, x, y)
  | NewExprB (e1,e2,e3) ->
      ((eval (e1, x, y)) + (eval (e2, x, y))) - (eval (e3, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewExprA of expr* expr
  | NewExprB of expr* expr* expr;;

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
  | NewExprA (e1,e2) ->
      if (eval (e1, x, y)) > (eval (e2, x, y))
      then eval (e1, x, y)
      else eval (e2, x, y)
  | NewExprB (e1,e2,e3) ->
      ((eval (e1, x, y)) +. (eval (e2, x, y))) -. (eval (e3, x, y));;

*)

(* changed spans
(32,7)-(32,66)
(eval (e1 , x , y) +. eval (e2 , x , y)) -. eval (e3 , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

*)

(* type error slice
(19,19)-(19,43)
(19,26)-(19,42)
(19,27)-(19,31)
(32,7)-(32,46)
(32,7)-(32,66)
(32,8)-(32,25)
(32,9)-(32,13)
(32,28)-(32,45)
(32,29)-(32,33)
(32,49)-(32,66)
(32,50)-(32,54)
*)
