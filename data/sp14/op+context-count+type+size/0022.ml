
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
  | Cube a -> ((eval (a, x, y)) * (eval (a, x, y))) * (eval (a, x, y));;


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
(27,14)-(27,51)
(27,14)-(27,70)
(27,15)-(27,31)
*)

(* type error slice
(16,2)-(27,70)
(16,2)-(27,70)
(17,13)-(17,14)
(19,28)-(19,37)
(19,35)-(19,36)
(21,21)-(21,59)
(21,22)-(21,38)
(21,23)-(21,27)
(27,14)-(27,51)
(27,14)-(27,51)
(27,14)-(27,70)
(27,14)-(27,70)
(27,15)-(27,31)
(27,16)-(27,20)
(27,34)-(27,50)
(27,35)-(27,39)
(27,54)-(27,70)
(27,55)-(27,59)
*)
