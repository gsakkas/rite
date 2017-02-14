
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
  | Sine e -> buildSine (eval (e, x, y))
  | Cosine e -> buildCosine (eval (e, x, y))
  | Average (e1,e2) -> buildAverage ((eval e1), (eval e2))
  | Times (e1,e2) -> buildTimes ((eval e1), e2)
  | Thresh (e1,e2,e3,e4) ->
      buildThresh ((eval e1), (eval e2), (eval e3), (eval e4));;


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
(21,14)-(30,62)
(25,14)-(25,23)
(25,24)-(25,40)
(26,16)-(26,27)
(26,28)-(26,44)
(27,23)-(27,35)
(27,23)-(27,58)
(27,36)-(27,58)
(27,37)-(27,46)
(27,43)-(27,45)
(27,48)-(27,57)
(27,54)-(27,56)
(28,21)-(28,31)
(28,21)-(28,47)
(28,32)-(28,47)
(28,33)-(28,42)
(28,39)-(28,41)
(28,44)-(28,46)
(30,6)-(30,17)
(30,6)-(30,62)
(30,18)-(30,62)
(30,19)-(30,28)
(30,25)-(30,27)
(30,30)-(30,39)
(30,36)-(30,38)
(30,41)-(30,50)
(30,42)-(30,46)
(30,47)-(30,49)
(30,53)-(30,57)
(30,58)-(30,60)
*)

(* type error slice
(22,2)-(30,62)
(22,2)-(30,62)
(22,2)-(30,62)
(22,2)-(30,62)
(22,2)-(30,62)
(22,2)-(30,62)
(22,2)-(30,62)
(25,24)-(25,40)
(25,25)-(25,29)
(25,30)-(25,39)
(27,37)-(27,46)
(27,38)-(27,42)
(27,43)-(27,45)
(27,48)-(27,57)
(27,49)-(27,53)
(27,54)-(27,56)
(28,33)-(28,42)
(28,34)-(28,38)
(28,39)-(28,41)
(30,19)-(30,28)
(30,20)-(30,24)
(30,25)-(30,27)
(30,30)-(30,39)
(30,31)-(30,35)
(30,36)-(30,38)
(30,41)-(30,50)
(30,42)-(30,46)
(30,47)-(30,49)
(30,52)-(30,61)
(30,53)-(30,57)
(30,58)-(30,60)
*)
