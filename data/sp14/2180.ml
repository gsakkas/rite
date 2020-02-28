
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Poly of expr* expr* expr
  | Tan of expr;;

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
  | Poly (a,b,c) ->
      ((eval (a, x, y)) *. (eval (a, x, y))) +
        ((eval (b, x, y)) *. (eval (c, x, y)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Poly of expr* expr* expr
  | Tan of expr;;

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
  | Poly (a,b,c) ->
      ((eval (a, x, y)) *. (eval (a, x, y))) +.
        ((eval (b, x, y)) *. (eval (c, x, y)));;

*)

(* changed spans
(28,7)-(29,47)
(eval (a , x , y) *. eval (a , x , y)) +. (eval (b , x , y) *. eval (c , x , y))
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

*)

(* type error slice
(16,3)-(29,47)
(19,15)-(19,18)
(19,15)-(19,43)
(28,7)-(28,45)
(28,7)-(29,47)
(29,9)-(29,47)
*)
