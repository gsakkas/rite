
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
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
(24,22)-(24,55)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(25,29)-(25,57)
if eval (e1 , x , y) < eval (e2 , x , y)
then eval (e3 , x , y)
else eval (e4 , x , y)
IteG (BopG EmptyG EmptyG) (AppG [EmptyG]) (AppG [EmptyG])

*)

(* type error slice
(11,4)-(11,70)
(11,18)-(11,68)
(11,39)-(11,68)
(13,4)-(13,42)
(13,17)-(13,40)
(13,26)-(13,40)
(18,3)-(25,57)
(21,16)-(21,19)
(21,16)-(21,45)
(21,27)-(21,44)
(21,28)-(21,32)
(21,33)-(21,43)
(24,22)-(24,32)
(24,22)-(24,55)
(24,34)-(24,43)
(24,35)-(24,39)
(24,40)-(24,42)
(24,45)-(24,54)
(24,46)-(24,50)
(24,51)-(24,53)
(25,29)-(25,40)
(25,29)-(25,57)
*)
