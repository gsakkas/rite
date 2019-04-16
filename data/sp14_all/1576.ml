
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x * 1.00
  | VarY  -> y * 1.00
  | Sine e -> pi * e
  | Cosine e -> pi * e
  | Average (e1,e2) -> buildAverage (e1, e2)
  | Times (e1,e2) -> buildTimes (e1, e2)
  | Thresh (e1,e2,e3,e4) -> buildThresh (e1, e2, e3, e4);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) = match e with | VarX  -> x | VarY  -> y;;

*)

(* changed spans
(20,3)-(27,57)
match e with
| VarX -> x
| VarY -> y
CaseG VarG (fromList [(ConPatG Nothing,Nothing,VarG)])

*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,44)
(11,28)-(11,44)
(13,4)-(13,70)
(13,18)-(13,68)
(13,39)-(13,68)
(15,4)-(15,42)
(15,17)-(15,40)
(15,26)-(15,40)
(17,4)-(17,29)
(17,10)-(17,27)
(20,3)-(27,57)
(21,14)-(21,22)
(21,18)-(21,22)
(22,14)-(22,22)
(22,18)-(22,22)
(23,15)-(23,17)
(23,15)-(23,21)
(23,20)-(23,21)
(24,17)-(24,19)
(24,17)-(24,23)
(24,22)-(24,23)
(25,24)-(25,36)
(25,24)-(25,45)
(26,22)-(26,32)
(26,22)-(26,41)
(27,29)-(27,40)
(27,29)-(27,57)
*)
