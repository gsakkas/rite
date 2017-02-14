
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildX () = VarX;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> buildX ()
  | VarY  -> y
  | Sine e -> buildSine e
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
(11,15)-(11,25)
(11,19)-(11,25)
(11,24)-(11,25)
(13,18)-(13,67)
(13,39)-(13,67)
(13,47)-(13,48)
(13,50)-(13,51)
(13,53)-(13,59)
(13,61)-(13,67)
(15,12)-(15,21)
(15,17)-(15,21)
(20,3)-(27,68)
(21,14)-(21,20)
(21,14)-(21,23)
(21,21)-(21,23)
(23,15)-(23,24)
(23,25)-(23,26)
(24,17)-(24,42)
(27,35)-(27,68)
*)

(* type error slice
(15,4)-(15,23)
(15,12)-(15,21)
(15,17)-(15,21)
(19,4)-(27,71)
(19,15)-(27,68)
(20,3)-(27,68)
(20,3)-(27,68)
(20,3)-(27,68)
(20,3)-(27,68)
(21,14)-(21,20)
(21,14)-(21,23)
(24,17)-(24,20)
(24,17)-(24,42)
(24,22)-(24,42)
(24,29)-(24,33)
(24,29)-(24,42)
(25,26)-(25,71)
(26,23)-(26,58)
*)
