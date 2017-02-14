
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
  | Cosine e -> cos * (pi *. (eval (e, x, y)))
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
(13,17)-(13,67)
(13,38)-(13,67)
(13,46)-(13,47)
(13,49)-(13,50)
(13,52)-(13,58)
(13,60)-(13,66)
(15,16)-(15,39)
(15,25)-(15,39)
(15,32)-(15,34)
(15,36)-(15,38)
(23,31)-(23,32)
(24,16)-(24,19)
(24,16)-(24,46)
(25,23)-(25,35)
(25,23)-(25,42)
(25,36)-(25,42)
(25,37)-(25,38)
(26,21)-(26,31)
(26,32)-(26,38)
(26,33)-(26,34)
(27,28)-(27,39)
(27,28)-(27,52)
(27,40)-(27,52)
(27,41)-(27,42)
(27,47)-(27,48)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(11,27)-(11,43)
(11,36)-(11,38)
(19,3)-(27,54)
(19,14)-(27,52)
(20,2)-(27,52)
(20,2)-(27,52)
(20,2)-(27,52)
(20,2)-(27,52)
(21,13)-(21,14)
(23,14)-(23,17)
(23,14)-(23,34)
(23,25)-(23,33)
(23,26)-(23,30)
(23,31)-(23,32)
(24,16)-(24,19)
(24,16)-(24,46)
(24,16)-(24,46)
(24,16)-(24,46)
(24,22)-(24,46)
(24,29)-(24,45)
(24,30)-(24,34)
(24,35)-(24,44)
(25,23)-(25,35)
(25,23)-(25,42)
(25,36)-(25,42)
(25,37)-(25,38)
*)
