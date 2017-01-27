
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Squared of expr
  | Flatten of expr* expr* expr;;

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
  | Squared e -> (eval (e, x, y)) ** 2.
  | Flatten (e1,e2,e3) ->
      ((eval (e1, x, y)) / (eval (e2, x, y))) / (eval (e3, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Squared of expr
  | Flatten of expr* expr* expr;;

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
  | Squared e -> (eval (e, x, y)) ** 2.
  | Flatten (e1,e2,e3) ->
      ((eval (e1, x, y)) /. (eval (e2, x, y))) /. (eval (e3, x, y));;

*)

(* changed spans
(29,9)-(29,23)
(29,9)-(29,43)
(29,9)-(29,64)
*)

(* type error slice
(16,3)-(29,64)
(17,14)-(17,15)
(19,27)-(19,31)
(19,27)-(19,40)
(19,33)-(19,34)
(19,33)-(19,40)
(19,36)-(19,37)
(19,39)-(19,40)
(29,9)-(29,13)
(29,9)-(29,23)
(29,9)-(29,43)
(29,9)-(29,64)
(29,15)-(29,17)
(29,15)-(29,23)
(29,19)-(29,20)
(29,22)-(29,23)
(29,29)-(29,33)
(29,29)-(29,43)
(29,35)-(29,37)
(29,35)-(29,43)
(29,39)-(29,40)
(29,42)-(29,43)
(29,50)-(29,54)
(29,50)-(29,64)
(29,56)-(29,58)
(29,56)-(29,64)
(29,60)-(29,61)
(29,63)-(29,64)
*)
