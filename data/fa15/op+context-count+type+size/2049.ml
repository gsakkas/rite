
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
(11,17)-(11,67)
(11,38)-(11,67)
(11,46)-(11,47)
(11,49)-(11,50)
(11,52)-(11,58)
(11,60)-(11,66)
(13,11)-(13,20)
(13,16)-(13,20)
(18,2)-(25,68)
(19,13)-(19,19)
(19,13)-(19,22)
(19,20)-(19,22)
(24,48)-(24,58)
(25,34)-(25,68)
*)

(* type error slice
(13,3)-(13,22)
(13,11)-(13,20)
(13,16)-(13,20)
(17,3)-(25,70)
(17,14)-(25,68)
(18,2)-(25,68)
(18,2)-(25,68)
(18,2)-(25,68)
(18,2)-(25,68)
(18,2)-(25,68)
(19,13)-(19,19)
(19,13)-(19,22)
(21,14)-(21,17)
(21,14)-(21,42)
(21,18)-(21,42)
(21,25)-(21,41)
(21,26)-(21,30)
(22,16)-(22,19)
(22,16)-(22,44)
(23,23)-(23,70)
(24,21)-(24,59)
*)
