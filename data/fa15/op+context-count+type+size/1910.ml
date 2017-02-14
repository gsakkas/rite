
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
(21,15)-(30,61)
(25,15)-(25,24)
(25,26)-(25,39)
(26,17)-(26,28)
(26,30)-(26,43)
(27,24)-(27,36)
(27,24)-(27,57)
(27,39)-(27,46)
(27,39)-(27,57)
(27,44)-(27,46)
(27,50)-(27,57)
(27,55)-(27,57)
(28,22)-(28,32)
(28,22)-(28,47)
(28,35)-(28,42)
(28,35)-(28,47)
(28,40)-(28,42)
(28,45)-(28,47)
(30,7)-(30,18)
(30,7)-(30,61)
(30,21)-(30,28)
(30,21)-(30,61)
(30,26)-(30,28)
(30,32)-(30,39)
(30,37)-(30,39)
(30,43)-(30,47)
(30,43)-(30,50)
(30,48)-(30,50)
(30,54)-(30,58)
(30,59)-(30,61)
*)

(* type error slice
(22,3)-(30,61)
(22,3)-(30,61)
(22,3)-(30,61)
(22,3)-(30,61)
(22,3)-(30,61)
(22,3)-(30,61)
(22,3)-(30,61)
(25,26)-(25,30)
(25,26)-(25,39)
(25,32)-(25,39)
(27,39)-(27,43)
(27,39)-(27,46)
(27,44)-(27,46)
(27,50)-(27,54)
(27,50)-(27,57)
(27,55)-(27,57)
(28,35)-(28,39)
(28,35)-(28,42)
(28,40)-(28,42)
(30,21)-(30,25)
(30,21)-(30,28)
(30,26)-(30,28)
(30,32)-(30,36)
(30,32)-(30,39)
(30,37)-(30,39)
(30,43)-(30,47)
(30,43)-(30,50)
(30,48)-(30,50)
(30,54)-(30,58)
(30,54)-(30,61)
(30,59)-(30,61)
*)
