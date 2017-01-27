
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
(27,29)-(27,30)
*)

(* type error slice
(15,3)-(29,25)
(17,11)-(17,15)
(17,11)-(17,24)
(17,17)-(17,18)
(17,17)-(17,24)
(17,20)-(17,21)
(17,23)-(17,24)
(27,11)-(27,15)
(27,11)-(27,24)
(27,11)-(27,30)
(27,17)-(27,18)
(27,17)-(27,24)
(27,20)-(27,21)
(27,23)-(27,24)
(27,29)-(27,30)
(28,13)-(28,37)
(28,33)-(28,37)
(28,34)-(28,37)
*)
