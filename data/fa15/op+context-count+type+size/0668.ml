
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
(11,19)-(11,43)
(11,28)-(11,43)
(11,37)-(11,39)
(11,41)-(11,43)
(13,17)-(13,29)
(13,21)-(13,29)
(13,28)-(13,29)
(15,15)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(17,18)-(17,67)
(17,39)-(17,67)
(17,47)-(17,48)
(17,50)-(17,51)
(17,53)-(17,59)
(17,61)-(17,67)
(19,17)-(19,39)
(19,26)-(19,39)
(19,33)-(19,35)
(19,37)-(19,39)
(21,15)-(29,56)
(25,16)-(25,25)
(25,27)-(25,34)
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
(21,4)-(29,59)
(21,15)-(29,56)
(22,3)-(29,56)
(25,27)-(25,31)
(25,27)-(25,34)
(25,32)-(25,34)
*)
