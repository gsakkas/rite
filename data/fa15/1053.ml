
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
  | VarX _ -> x
  | VarY _ -> y
  | Sine x1 -> eval ((buildSine x1), x, y)
  | Cosine x2 -> eval ((buildCosine x2), x, y)
  | Average (x3,x4) -> eval ((buildAverage (x3, x4)), x, y)
  | Times (x5,x6) -> eval ((buildTimes (x5, x6)), x, y)
  | Thresh (x7,x8,x9,x0) -> eval (buildThresh (x7, x8, x9, x0));;


(* fix

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
  | VarX _ -> x
  | VarY _ -> y
  | Sine x1 -> eval ((buildSine x1), x, y)
  | Cosine x2 -> eval ((buildCosine x2), x, y)
  | Average (x3,x4) -> eval ((buildAverage (x3, x4)), x, y)
  | Times (x5,x6) -> eval ((buildTimes (x5, x6)), x, y)
  | Thresh (x7,x8,x9,x0) -> eval ((buildThresh (x7, x8, x9, x0)), x, y);;

*)

(* changed spans
(29,33)-(29,63)
*)

(* type error slice
(17,3)-(17,69)
(17,17)-(17,67)
(17,38)-(17,67)
(28,21)-(28,25)
(28,21)-(28,55)
(28,26)-(28,55)
(29,28)-(29,32)
(29,28)-(29,63)
(29,33)-(29,63)
(29,34)-(29,45)
*)

(* all spans
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
(21,14)-(29,63)
(22,2)-(29,63)
(22,8)-(22,9)
(23,14)-(23,15)
(24,14)-(24,15)
(25,15)-(25,42)
(25,15)-(25,19)
(25,20)-(25,42)
(25,21)-(25,35)
(25,22)-(25,31)
(25,32)-(25,34)
(25,37)-(25,38)
(25,40)-(25,41)
(26,17)-(26,46)
(26,17)-(26,21)
(26,22)-(26,46)
(26,23)-(26,39)
(26,24)-(26,35)
(26,36)-(26,38)
(26,41)-(26,42)
(26,44)-(26,45)
(27,23)-(27,59)
(27,23)-(27,27)
(27,28)-(27,59)
(27,29)-(27,52)
(27,30)-(27,42)
(27,43)-(27,51)
(27,44)-(27,46)
(27,48)-(27,50)
(27,54)-(27,55)
(27,57)-(27,58)
(28,21)-(28,55)
(28,21)-(28,25)
(28,26)-(28,55)
(28,27)-(28,48)
(28,28)-(28,38)
(28,39)-(28,47)
(28,40)-(28,42)
(28,44)-(28,46)
(28,50)-(28,51)
(28,53)-(28,54)
(29,28)-(29,63)
(29,28)-(29,32)
(29,33)-(29,63)
(29,34)-(29,45)
(29,46)-(29,62)
(29,47)-(29,49)
(29,51)-(29,53)
(29,55)-(29,57)
(29,59)-(29,61)
*)
