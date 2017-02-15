
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
(11,17)-(11,67)
(11,38)-(11,67)
(11,46)-(11,47)
(11,49)-(11,50)
(11,52)-(11,58)
(11,60)-(11,66)
(23,28)-(23,39)
(23,28)-(23,52)
(23,40)-(23,52)
(23,41)-(23,42)
(23,47)-(23,48)
*)

(* type error slice
(11,3)-(11,69)
(11,17)-(11,67)
(11,38)-(11,67)
(11,46)-(11,47)
(15,3)-(23,54)
(15,14)-(23,52)
(16,2)-(23,52)
(16,2)-(23,52)
(16,2)-(23,52)
(16,2)-(23,52)
(16,2)-(23,52)
(17,13)-(17,14)
(19,14)-(19,17)
(19,14)-(19,42)
(19,18)-(19,42)
(19,25)-(19,41)
(19,26)-(19,30)
(20,16)-(20,19)
(20,16)-(20,44)
(21,23)-(21,70)
(22,21)-(22,59)
(23,28)-(23,39)
(23,28)-(23,52)
(23,40)-(23,52)
(23,41)-(23,42)
*)
