
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Golden of expr
  | MeanPi of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Golden e' -> cos (((eval (e', x, y)) *. x) * y)
  | MeanPi (e1,e2,e3) ->
      sin (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Golden of expr
  | MeanPi of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Golden e' -> cos (((eval (e', x, y)) *. x) *. y)
  | MeanPi (e1,e2,e3) ->
      sin (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y)));;

*)

(* changed spans
(27,21)-(27,51)
(27,23)-(27,40)
*)

(* type error slice
(16,2)-(29,73)
(16,2)-(29,73)
(17,13)-(17,14)
(18,13)-(18,14)
(27,17)-(27,20)
(27,17)-(27,51)
(27,21)-(27,51)
(27,21)-(27,51)
(27,21)-(27,51)
(27,22)-(27,46)
(27,22)-(27,46)
(27,44)-(27,45)
(27,49)-(27,50)
*)
