
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec eval (e,x,y) =
  match e with
  | buildX -> buildX ()
  | buildY -> buildY ()
  | Sine e -> buildSine (eval (e, x, y))
  | Cosine e -> buildCosine (eval (e, x, y))
  | Average (e1,e2) -> buildAverage ((eval (e1, x, y)), (eval (e2, x, y)))
  | Times (e1,e2) -> buildTimes ((eval (e1, x, y)), (eval (e2, x, y)))
  | Thresh (a,b,a_less,b_less) ->
      buildThresh (a, b, a_less, (eval (b_less, x, y)));;


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
(11,18)-(11,43)
(11,27)-(11,43)
(11,36)-(11,38)
(11,40)-(11,42)
(13,16)-(13,28)
(13,20)-(13,28)
(13,27)-(13,28)
(15,14)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(17,17)-(17,67)
(17,38)-(17,67)
(17,46)-(17,47)
(17,49)-(17,50)
(17,52)-(17,58)
(17,60)-(17,66)
(19,16)-(19,39)
(19,25)-(19,39)
(19,32)-(19,34)
(19,36)-(19,38)
(21,14)-(30,55)
(23,14)-(23,20)
(23,14)-(23,23)
(23,21)-(23,23)
(24,14)-(24,20)
(24,14)-(24,23)
(24,21)-(24,23)
(25,14)-(25,23)
(25,14)-(25,40)
(25,24)-(25,40)
(26,16)-(26,27)
(26,28)-(26,44)
(27,23)-(27,35)
(27,23)-(27,74)
(27,36)-(27,74)
(27,37)-(27,54)
(28,21)-(28,70)
(30,6)-(30,55)
*)

(* type error slice
(21,3)-(30,57)
(21,14)-(30,55)
(22,2)-(30,55)
(22,2)-(30,55)
(22,2)-(30,55)
(22,2)-(30,55)
(22,2)-(30,55)
(22,2)-(30,55)
(22,2)-(30,55)
(22,2)-(30,55)
(22,2)-(30,55)
(22,2)-(30,55)
(22,2)-(30,55)
(22,2)-(30,55)
(22,8)-(22,9)
(23,14)-(23,20)
(23,14)-(23,23)
(25,24)-(25,40)
(25,25)-(25,29)
(25,30)-(25,39)
(25,31)-(25,32)
*)
