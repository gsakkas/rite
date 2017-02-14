
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
(11,18)-(11,43)
(11,27)-(11,43)
(11,36)-(11,38)
(11,40)-(11,42)
(13,16)-(13,28)
(13,20)-(13,28)
(13,27)-(13,28)
(15,17)-(15,67)
(15,38)-(15,67)
(15,46)-(15,47)
(15,49)-(15,50)
(15,52)-(15,58)
(15,60)-(15,66)
(17,16)-(17,39)
(17,25)-(17,39)
(17,32)-(17,34)
(17,36)-(17,38)
(25,31)-(25,32)
(26,16)-(26,27)
(26,16)-(26,44)
(26,28)-(26,44)
(27,23)-(27,35)
(27,23)-(27,42)
(27,36)-(27,42)
(27,37)-(27,38)
(28,21)-(28,31)
(28,32)-(28,38)
(28,33)-(28,34)
(29,28)-(29,39)
(29,28)-(29,52)
(29,40)-(29,52)
(29,41)-(29,42)
(29,47)-(29,48)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(11,27)-(11,43)
(11,36)-(11,38)
(21,3)-(29,54)
(21,14)-(29,52)
(22,2)-(29,52)
(22,2)-(29,52)
(22,2)-(29,52)
(23,13)-(23,14)
(25,14)-(25,17)
(25,14)-(25,34)
(25,25)-(25,33)
(25,26)-(25,30)
(25,31)-(25,32)
(26,28)-(26,44)
(26,29)-(26,33)
(26,34)-(26,43)
(27,23)-(27,35)
(27,23)-(27,42)
(27,36)-(27,42)
(27,37)-(27,38)
*)
