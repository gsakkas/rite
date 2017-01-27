
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
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2
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
(19,68)-(19,69)
(20,23)-(20,34)
(20,28)-(20,30)
(20,40)-(20,51)
(20,45)-(20,47)
(22,17)-(22,22)
(22,34)-(22,39)
(23,18)-(23,28)
(24,18)-(24,28)
*)

(* type error slice
(14,3)-(24,28)
(17,28)-(17,32)
(17,28)-(17,42)
(17,34)-(17,36)
(17,34)-(17,42)
(17,38)-(17,39)
(17,41)-(17,42)
(19,26)-(19,69)
(19,68)-(19,69)
(20,23)-(20,27)
(20,23)-(20,34)
(20,28)-(20,30)
(20,31)-(20,32)
(20,33)-(20,34)
(20,40)-(20,44)
(20,40)-(20,51)
(20,45)-(20,47)
(20,48)-(20,49)
(20,50)-(20,51)
(22,17)-(22,18)
(22,17)-(22,22)
(22,19)-(22,20)
(22,21)-(22,22)
(22,34)-(22,35)
(22,34)-(22,39)
(22,36)-(22,37)
(22,38)-(22,39)
(23,18)-(23,24)
(23,18)-(23,28)
(23,25)-(23,26)
(23,27)-(23,28)
(24,18)-(24,24)
(24,18)-(24,28)
(24,25)-(24,26)
(24,27)-(24,28)
*)
