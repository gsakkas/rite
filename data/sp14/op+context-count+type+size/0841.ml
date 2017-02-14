
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
(17,34)-(17,40)
(18,30)-(18,41)
(18,35)-(18,37)
(19,26)-(19,37)
(19,31)-(19,33)
(19,43)-(19,54)
(19,48)-(19,50)
(19,60)-(19,61)
(20,23)-(20,34)
(20,28)-(20,30)
(20,40)-(20,51)
(20,45)-(20,47)
(22,17)-(22,22)
(22,34)-(22,39)
(23,18)-(23,28)
(24,18)-(24,24)
(24,18)-(24,28)
(24,25)-(24,26)
(24,27)-(24,28)
*)

(* type error slice
(14,3)-(24,28)
(14,3)-(24,28)
(14,3)-(24,28)
(14,3)-(24,28)
(14,3)-(24,28)
(17,21)-(17,40)
(17,28)-(17,32)
(17,28)-(17,40)
(17,34)-(17,36)
(17,34)-(17,40)
(18,30)-(18,34)
(18,30)-(18,41)
(19,26)-(19,30)
(19,26)-(19,37)
(19,26)-(19,61)
(19,43)-(19,47)
(19,43)-(19,54)
(19,60)-(19,61)
(20,23)-(20,27)
(20,23)-(20,34)
(20,40)-(20,44)
(20,40)-(20,51)
(22,17)-(22,18)
(22,17)-(22,22)
(22,34)-(22,35)
(22,34)-(22,39)
(23,18)-(23,24)
(23,18)-(23,28)
(24,18)-(24,24)
(24,18)-(24,28)
*)
