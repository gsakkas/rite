
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
(16,3)-(32,30)
(23,25)-(23,28)
(23,25)-(23,44)
(23,25)-(23,71)
(23,30)-(23,34)
(23,30)-(23,44)
(23,36)-(23,38)
(23,36)-(23,44)
(23,40)-(23,41)
(23,43)-(23,44)
(23,48)-(23,50)
(23,52)-(23,55)
(23,52)-(23,71)
(23,57)-(23,61)
(23,57)-(23,71)
(23,63)-(23,65)
(23,63)-(23,71)
(23,67)-(23,68)
(23,70)-(23,71)
(31,12)-(31,30)
(32,12)-(32,30)
*)

(* type error slice
(19,20)-(19,40)
(19,27)-(19,31)
(19,27)-(19,40)
(23,25)-(23,28)
(23,25)-(23,44)
(23,30)-(23,34)
(23,30)-(23,44)
(23,52)-(23,55)
(23,52)-(23,71)
(23,57)-(23,61)
(23,57)-(23,71)
*)
