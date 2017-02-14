
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Abs of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | VarY  -> y
  | VarX  -> x
  | Abs a ->
      if (eval (a, x, y)) < 0
      then (eval (a, x, y)) *. (-1.0)
      else eval (a, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Abs of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | VarY  -> y
  | VarX  -> x
  | Abs a ->
      if (eval (a, x, y)) < 0.0
      then (eval (a, x, y)) *. (-1.0)
      else eval (a, x, y);;

*)

(* changed spans
(27,28)-(27,29)
*)

(* type error slice
(20,19)-(20,35)
(20,19)-(20,55)
(20,20)-(20,24)
(27,9)-(27,25)
(27,9)-(27,29)
(27,9)-(27,29)
(27,10)-(27,14)
(27,28)-(27,29)
(28,11)-(28,37)
(28,31)-(28,37)
(28,31)-(28,37)
(28,33)-(28,36)
*)
