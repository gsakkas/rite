
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

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi * (eval e1))
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
(11,19)-(11,43)
(11,28)-(11,43)
(11,37)-(11,39)
(11,41)-(11,43)
(13,17)-(13,29)
(13,21)-(13,29)
(13,28)-(13,29)
(15,18)-(15,67)
(15,39)-(15,67)
(15,47)-(15,48)
(15,50)-(15,51)
(15,53)-(15,59)
(15,61)-(15,67)
(17,17)-(17,39)
(17,26)-(17,39)
(17,33)-(17,35)
(17,37)-(17,39)
(25,21)-(25,34)
(25,32)-(25,34)
(26,18)-(26,29)
(26,18)-(26,38)
(26,31)-(26,38)
(26,36)-(26,38)
(27,24)-(27,36)
(27,24)-(27,57)
(27,39)-(27,46)
(27,39)-(27,57)
(27,44)-(27,46)
(27,50)-(27,57)
(27,55)-(27,57)
(28,22)-(28,32)
(28,22)-(28,53)
(28,35)-(28,42)
(28,35)-(28,53)
(28,40)-(28,42)
(28,46)-(28,53)
(28,51)-(28,53)
(29,29)-(29,40)
(29,29)-(29,56)
(29,42)-(29,44)
(29,42)-(29,56)
(29,46)-(29,48)
(29,50)-(29,52)
(29,54)-(29,56)
*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,43)
(11,28)-(11,43)
(11,41)-(11,43)
(13,4)-(13,31)
(13,17)-(13,29)
(13,21)-(13,29)
(13,28)-(13,29)
(17,4)-(17,42)
(17,17)-(17,39)
(17,26)-(17,39)
(17,37)-(17,39)
(19,4)-(19,29)
(19,10)-(19,26)
(21,4)-(29,59)
(21,15)-(29,56)
(22,3)-(29,56)
(25,16)-(25,19)
(25,16)-(25,34)
(25,21)-(25,23)
(25,21)-(25,34)
(25,21)-(25,34)
(25,21)-(25,34)
(25,27)-(25,31)
(25,27)-(25,34)
(25,32)-(25,34)
(26,18)-(26,29)
(26,18)-(26,38)
(26,31)-(26,35)
(26,31)-(26,38)
(27,24)-(27,36)
(27,24)-(27,57)
(27,39)-(27,57)
(27,50)-(27,54)
(27,50)-(27,57)
(28,22)-(28,32)
(28,22)-(28,53)
(28,35)-(28,53)
(28,46)-(28,50)
(28,46)-(28,53)
*)
