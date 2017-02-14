
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

let buildX () = VarX;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> buildX ()
  | buildY -> buildY ()
  | Sine e -> buildSine (eval (e, x, y))
  | Cosine e -> buildCosine (eval (e, x, y))
  | Average (e1,e2) -> buildAverage ((eval (e1, x, y)), (eval (e2, x, y)))
  | Times (e1,e2) -> buildTimes ((eval (e1, x, y)), (eval (e2, x, y)))
  | Thresh (a,b,a_less,b_less) ->
      buildThresh (a, b, a_less, (eval (b_less, x, y)));;


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
  | buildX -> x
  | buildY -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) -> 0.0;;

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
(21,12)-(21,21)
(21,17)-(21,21)
(23,15)-(32,53)
(24,3)-(32,53)
(25,14)-(25,20)
(25,14)-(25,23)
(25,21)-(25,23)
(26,15)-(26,21)
(26,15)-(26,24)
(26,22)-(26,24)
(27,15)-(27,24)
(27,15)-(27,39)
(27,26)-(27,39)
(28,17)-(28,28)
(28,30)-(28,43)
(29,24)-(29,36)
(29,24)-(29,72)
(29,39)-(29,53)
(29,39)-(29,72)
(30,22)-(30,68)
(32,7)-(32,53)
*)

(* type error slice
(24,3)-(32,53)
(24,3)-(32,53)
(24,3)-(32,53)
(26,15)-(26,21)
(26,15)-(26,24)
*)
