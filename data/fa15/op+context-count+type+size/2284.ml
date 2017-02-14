
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
(11,14)-(11,24)
(11,18)-(11,24)
(11,23)-(11,24)
(13,17)-(13,67)
(13,38)-(13,67)
(13,46)-(13,47)
(13,49)-(13,50)
(13,52)-(13,58)
(13,60)-(13,66)
(15,11)-(15,20)
(15,16)-(15,20)
(20,2)-(27,68)
(21,13)-(21,19)
(21,13)-(21,22)
(21,20)-(21,22)
(23,14)-(23,23)
(23,24)-(23,25)
(24,16)-(24,44)
(27,34)-(27,68)
*)

(* type error slice
(15,3)-(15,22)
(15,11)-(15,20)
(15,16)-(15,20)
(19,3)-(27,70)
(19,14)-(27,68)
(20,2)-(27,68)
(20,2)-(27,68)
(20,2)-(27,68)
(20,2)-(27,68)
(21,13)-(21,19)
(21,13)-(21,22)
(24,16)-(24,19)
(24,16)-(24,44)
(24,20)-(24,44)
(24,27)-(24,43)
(24,28)-(24,32)
(25,23)-(25,70)
(26,21)-(26,59)
*)
