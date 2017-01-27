
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Cube of expr
  | Addition of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> eval (a, (sin (pi *. x)), (sin (pi *. y)))
  | Cosine a -> eval (a, (cos (pi *. x)), (cos (pi *. y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Cube a -> ((eval a) * (eval a)) * (eval a);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Cube of expr
  | Addition of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> eval (a, (sin (pi *. x)), (sin (pi *. y)))
  | Cosine a -> eval (a, (cos (pi *. x)), (cos (pi *. y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Cube a -> ((eval (a, x, y)) *. (eval (a, x, y))) *. (eval (a, x, y));;

*)

(* changed spans
(27,17)-(27,23)
(27,17)-(27,34)
(27,17)-(27,46)
(27,22)-(27,23)
(27,28)-(27,34)
(27,33)-(27,34)
(27,40)-(27,44)
(27,40)-(27,46)
(27,45)-(27,46)
*)

(* type error slice
(16,3)-(27,46)
(17,14)-(17,15)
(19,15)-(19,19)
(19,15)-(19,54)
(19,21)-(19,22)
(19,21)-(19,54)
(19,25)-(19,28)
(19,25)-(19,37)
(19,30)-(19,37)
(19,42)-(19,45)
(19,42)-(19,54)
(19,47)-(19,54)
(27,17)-(27,21)
(27,17)-(27,23)
(27,17)-(27,46)
(27,22)-(27,23)
(27,28)-(27,32)
(27,28)-(27,34)
(27,33)-(27,34)
(27,40)-(27,44)
(27,40)-(27,46)
(27,45)-(27,46)
*)
