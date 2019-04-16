
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
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
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
(26,18)-(26,39)
cos (pi *. eval (e1 , x , y))
AppG (fromList [BopG EmptyG EmptyG])

(27,24)-(27,59)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(28,22)-(28,55)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(29,29)-(29,57)
if eval (e1 , x , y) < eval (e2 , x , y)
then eval (e3 , x , y)
else eval (e4 , x , y)
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,44)
(11,28)-(11,44)
(13,4)-(13,31)
(13,17)-(13,29)
(13,21)-(13,29)
(13,28)-(13,29)
(15,4)-(15,70)
(15,18)-(15,68)
(15,39)-(15,68)
(17,4)-(17,42)
(17,17)-(17,40)
(17,26)-(17,40)
(22,3)-(29,57)
(25,16)-(25,19)
(25,16)-(25,45)
(25,20)-(25,45)
(25,27)-(25,44)
(25,28)-(25,32)
(25,33)-(25,43)
(26,18)-(26,29)
(26,18)-(26,39)
(26,30)-(26,39)
(26,31)-(26,35)
(26,36)-(26,38)
(27,24)-(27,36)
(27,24)-(27,59)
(27,38)-(27,47)
(27,39)-(27,43)
(27,44)-(27,46)
(27,49)-(27,58)
(27,50)-(27,54)
(27,55)-(27,57)
(28,22)-(28,32)
(28,22)-(28,55)
(28,34)-(28,43)
(28,35)-(28,39)
(28,40)-(28,42)
(28,45)-(28,54)
(28,46)-(28,50)
(28,51)-(28,53)
(29,29)-(29,40)
(29,29)-(29,57)
*)
