
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
  | Sine e -> sin (pi *. (eval e))
  | Cosine e -> buildCosine (eval (e, x, y))
  | Average (e1,e2) -> buildAverage (x, y)
  | Times (e1,e2) -> buildTimes (x, y)
  | Thresh (e1,e2,e3,e4) -> buildThresh (x, y, x, y);;


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
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
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
(25,32)-(25,33)
(26,17)-(26,28)
(26,17)-(26,43)
(26,30)-(26,43)
(27,24)-(27,36)
(27,24)-(27,42)
(27,38)-(27,39)
(27,38)-(27,42)
(28,22)-(28,32)
(28,34)-(28,35)
(28,34)-(28,38)
(29,29)-(29,40)
(29,29)-(29,52)
(29,42)-(29,43)
(29,42)-(29,52)
(29,48)-(29,49)
*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,43)
(11,28)-(11,43)
(11,37)-(11,39)
(21,4)-(29,55)
(21,15)-(29,52)
(22,3)-(29,52)
(22,3)-(29,52)
(22,3)-(29,52)
(23,14)-(23,15)
(25,15)-(25,18)
(25,15)-(25,33)
(25,27)-(25,31)
(25,27)-(25,33)
(25,32)-(25,33)
(26,30)-(26,34)
(26,30)-(26,43)
(26,36)-(26,43)
(27,24)-(27,36)
(27,24)-(27,42)
(27,38)-(27,39)
(27,38)-(27,42)
*)
