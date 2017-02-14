
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildX () = VarX;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> buildX ()
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) -> buildThresh (a, b, a_less, b_less);;


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
  | buildX -> x
  | buildY -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) -> 0.0;;

*)

(* changed spans
(11,18)-(11,67)
(11,39)-(11,67)
(11,47)-(11,48)
(11,50)-(11,51)
(11,53)-(11,59)
(11,61)-(11,67)
(13,12)-(13,21)
(13,17)-(13,21)
(18,3)-(25,68)
(19,14)-(19,20)
(19,14)-(19,23)
(19,21)-(19,23)
(25,35)-(25,68)
*)

(* type error slice
(13,4)-(13,23)
(13,12)-(13,21)
(13,17)-(13,21)
(17,4)-(25,71)
(17,15)-(25,68)
(18,3)-(25,68)
(18,3)-(25,68)
(18,3)-(25,68)
(18,3)-(25,68)
(18,3)-(25,68)
(19,14)-(19,20)
(19,14)-(19,23)
(21,15)-(21,18)
(21,15)-(21,40)
(21,20)-(21,40)
(21,27)-(21,31)
(21,27)-(21,40)
(22,17)-(22,20)
(22,17)-(22,42)
(23,26)-(23,71)
(24,23)-(24,58)
*)
