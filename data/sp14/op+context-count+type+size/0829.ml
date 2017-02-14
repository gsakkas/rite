
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | PowerUp of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | PowerUp (e1,e2) -> (abs (eval (e1, x, y))) ** (abs (eval (e2, x, y)))
  | Square2 (e1,e2,e3) ->
      (sqrt
         ((((eval (e1, x, y)) ** 2.) +. ((eval (e2, x, y)) ** 2.)) +.
            ((eval (e3, x, y)) ** 2.)))
        /. 2.
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | PowerUp of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Square2 (e1,e2,e3) ->
      (sqrt
         ((((eval (e1, x, y)) ** 2.) +. ((eval (e2, x, y)) ** 2.)) +.
            ((eval (e3, x, y)) ** 2.)))
        /. 2.
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y);;

*)

(* changed spans
(16,2)-(32,30)
(23,23)-(23,46)
(23,23)-(23,73)
(23,24)-(23,27)
(23,28)-(23,45)
(23,29)-(23,33)
(23,34)-(23,44)
(23,35)-(23,37)
(23,39)-(23,40)
(23,42)-(23,43)
(23,47)-(23,49)
(23,50)-(23,73)
(23,51)-(23,54)
(23,55)-(23,72)
(23,56)-(23,60)
(23,61)-(23,71)
(23,62)-(23,64)
(23,66)-(23,67)
(23,69)-(23,70)
(31,11)-(31,30)
(32,11)-(32,30)
*)

(* type error slice
(19,18)-(19,42)
(19,25)-(19,41)
(19,26)-(19,30)
(23,23)-(23,46)
(23,24)-(23,27)
(23,28)-(23,45)
(23,29)-(23,33)
(23,50)-(23,73)
(23,51)-(23,54)
(23,55)-(23,72)
(23,56)-(23,60)
*)
