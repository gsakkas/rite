
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
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> buildSine (eval e1)
  | Cosine e1 -> buildCosine (eval e1)
  | Average (e1,e2) -> buildAverage ((eval e1), (eval e2))
  | Times (e1,e2) -> buildTimes ((eval e1), (eval e2))
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

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

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
(21,14)-(29,56)
(25,15)-(25,24)
(25,25)-(25,34)
(25,31)-(25,33)
(26,17)-(26,28)
(26,17)-(26,38)
(26,29)-(26,38)
(26,35)-(26,37)
(27,23)-(27,35)
(27,23)-(27,58)
(27,36)-(27,58)
(27,37)-(27,46)
(27,43)-(27,45)
(27,48)-(27,57)
(27,54)-(27,56)
(28,21)-(28,31)
(28,21)-(28,54)
(28,32)-(28,54)
(28,33)-(28,42)
(28,39)-(28,41)
(28,44)-(28,53)
(28,50)-(28,52)
(29,28)-(29,39)
(29,28)-(29,56)
(29,40)-(29,56)
(29,41)-(29,43)
(29,45)-(29,47)
(29,49)-(29,51)
(29,53)-(29,55)
*)

(* type error slice
(21,3)-(29,58)
(21,14)-(29,56)
(22,2)-(29,56)
(25,25)-(25,34)
(25,26)-(25,30)
(25,31)-(25,33)
*)
