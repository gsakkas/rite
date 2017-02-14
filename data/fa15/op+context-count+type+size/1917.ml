
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
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval e))
  | Cosine e -> cos * (pi *. (eval e))
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
(13,18)-(13,67)
(13,39)-(13,67)
(13,47)-(13,48)
(13,50)-(13,51)
(13,53)-(13,59)
(13,61)-(13,67)
(15,17)-(15,39)
(15,26)-(15,39)
(15,33)-(15,35)
(15,37)-(15,39)
(23,32)-(23,33)
(24,17)-(24,20)
(24,17)-(24,37)
(24,36)-(24,37)
(25,24)-(25,36)
(25,24)-(25,42)
(25,38)-(25,39)
(25,38)-(25,42)
(26,22)-(26,32)
(26,34)-(26,35)
(26,34)-(26,38)
(27,29)-(27,40)
(27,29)-(27,52)
(27,42)-(27,43)
(27,42)-(27,52)
(27,48)-(27,49)
*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,43)
(11,28)-(11,43)
(11,37)-(11,39)
(19,4)-(27,55)
(19,15)-(27,52)
(20,3)-(27,52)
(20,3)-(27,52)
(20,3)-(27,52)
(20,3)-(27,52)
(21,14)-(21,15)
(23,15)-(23,18)
(23,15)-(23,33)
(23,27)-(23,31)
(23,27)-(23,33)
(23,32)-(23,33)
(24,17)-(24,20)
(24,17)-(24,37)
(24,17)-(24,37)
(24,17)-(24,37)
(24,24)-(24,37)
(25,24)-(25,36)
(25,24)-(25,42)
(25,38)-(25,39)
(25,38)-(25,42)
*)
