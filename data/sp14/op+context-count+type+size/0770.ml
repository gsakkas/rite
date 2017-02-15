
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
  | Sine e' -> sin (pi *. (eval (e' x y)))
  | Cosine e' -> cos (pi *. (eval e' x y))
  | Average (e1,e2) -> ((eval e1 x y) +. (eval e2 x y)) /. 2
  | Times (e1,e2) -> (eval e1 x y) *. (eval e2 x y)
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a x y)) < (eval (b x y))
      then eval (a_less x y)
      else eval (b_less x y);;


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
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y);;

*)

(* changed spans
(17,32)-(17,40)
(18,28)-(18,41)
(18,34)-(18,36)
(19,24)-(19,37)
(19,30)-(19,32)
(19,41)-(19,54)
(19,47)-(19,49)
(19,59)-(19,60)
(20,21)-(20,34)
(20,27)-(20,29)
(20,38)-(20,51)
(20,44)-(20,46)
(22,15)-(22,22)
(22,32)-(22,39)
(23,16)-(23,28)
(24,16)-(24,28)
(24,17)-(24,23)
(24,24)-(24,25)
(24,26)-(24,27)
*)

(* type error slice
(14,2)-(24,28)
(14,2)-(24,28)
(14,2)-(24,28)
(14,2)-(24,28)
(14,2)-(24,28)
(17,19)-(17,42)
(17,26)-(17,41)
(17,27)-(17,31)
(17,32)-(17,40)
(17,33)-(17,35)
(18,28)-(18,41)
(18,29)-(18,33)
(19,23)-(19,60)
(19,24)-(19,37)
(19,25)-(19,29)
(19,41)-(19,54)
(19,42)-(19,46)
(19,59)-(19,60)
(20,21)-(20,34)
(20,22)-(20,26)
(20,38)-(20,51)
(20,39)-(20,43)
(22,15)-(22,22)
(22,16)-(22,17)
(22,32)-(22,39)
(22,33)-(22,34)
(23,16)-(23,28)
(23,17)-(23,23)
(24,16)-(24,28)
(24,17)-(24,23)
*)
