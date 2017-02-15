
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
  | Sine e' -> sin (pi *. (eval e' x y))
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
(17,26)-(17,39)
(17,32)-(17,34)
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
(24,11)-(24,15)
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
(14,2)-(24,28)
(17,15)-(17,18)
(17,15)-(17,40)
(19,23)-(19,60)
(19,59)-(19,60)
(20,38)-(20,51)
(20,39)-(20,43)
(22,6)-(24,28)
(22,15)-(22,22)
(22,16)-(22,17)
(22,32)-(22,39)
(22,33)-(22,34)
(23,11)-(23,15)
(23,11)-(23,28)
(23,16)-(23,28)
(23,17)-(23,23)
(24,16)-(24,28)
(24,17)-(24,23)
*)
