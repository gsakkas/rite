
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
(27,15)-(27,47)
(eval (a , x , y) *. eval (a , x , y)) *. eval (a , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

*)

(* type error slice
(16,3)-(27,47)
(17,14)-(17,15)
(19,15)-(19,19)
(19,15)-(19,57)
(19,20)-(19,57)
(19,29)-(19,38)
(19,36)-(19,37)
(27,15)-(27,47)
(27,16)-(27,24)
(27,17)-(27,21)
(27,22)-(27,23)
(27,27)-(27,35)
(27,28)-(27,32)
(27,33)-(27,34)
(27,39)-(27,47)
(27,40)-(27,44)
(27,45)-(27,46)
*)
