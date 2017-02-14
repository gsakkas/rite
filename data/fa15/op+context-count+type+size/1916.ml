
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) -> buildThresh (x, y, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(11,18)-(11,67)
(11,39)-(11,67)
(11,47)-(11,48)
(11,50)-(11,51)
(11,53)-(11,59)
(11,61)-(11,67)
(23,29)-(23,40)
(23,29)-(23,52)
(23,42)-(23,43)
(23,42)-(23,52)
(23,48)-(23,49)
*)

(* type error slice
(11,4)-(11,70)
(11,18)-(11,67)
(11,39)-(11,67)
(11,47)-(11,48)
(15,4)-(23,55)
(15,15)-(23,52)
(16,3)-(23,52)
(16,3)-(23,52)
(16,3)-(23,52)
(16,3)-(23,52)
(16,3)-(23,52)
(17,14)-(17,15)
(19,15)-(19,18)
(19,15)-(19,40)
(19,20)-(19,40)
(19,27)-(19,31)
(19,27)-(19,40)
(20,17)-(20,20)
(20,17)-(20,42)
(21,26)-(21,71)
(22,23)-(22,58)
(23,29)-(23,40)
(23,29)-(23,52)
(23,42)-(23,43)
(23,42)-(23,52)
*)
