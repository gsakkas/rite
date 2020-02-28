
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareAv of expr* expr
  | MultHalf of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | SquareAv (a,b) ->
      (((eval (a, x, y)) *. (eval (a, x, y))) +.
         ((eval (b, x, y)) *. (eval (b, x, y))))
        / 2.0
  | MultHalf (a,b,c) ->
      (((eval (a, x, y)) *. (eval (b, x, y))) *. (eval (c, x, y))) / 2.0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareAv of expr* expr
  | MultHalf of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | SquareAv (a,b) ->
      (((eval (a, x, y)) *. (eval (a, x, y))) +.
         ((eval (b, x, y)) *. (eval (b, x, y))))
        /. 2.0
  | MultHalf (a,b,c) ->
      (((eval (a, x, y)) *. (eval (b, x, y))) *. (eval (c, x, y))) /. 2.0;;

*)

(* changed spans
(28,7)-(30,14)
((eval (a , x , y) *. eval (a , x , y)) +. (eval (b , x , y) *. eval (b , x , y))) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(32,7)-(32,73)
((eval (a , x , y) *. eval (b , x , y)) *. eval (c , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

*)

(* type error slice
(16,3)-(32,73)
(19,15)-(19,18)
(19,15)-(19,43)
(28,7)-(29,49)
(28,7)-(30,14)
(30,11)-(30,14)
(32,7)-(32,67)
(32,7)-(32,73)
(32,70)-(32,73)
*)
