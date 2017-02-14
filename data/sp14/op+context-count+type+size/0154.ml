
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
  | Average (e1,e2) -> ((eval e1 x y) +. (eval e2 x y)) / 2
  | Times (e1,e2) -> (eval e1 x y) *. (eval e2 x y)
  | Thresh (e1,e2,e3,e4) ->
      if (eval e1 x y) < (eval e2 x y) then eval e3 x y else eval e4 x y;;


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
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(14,2)-(22,72)
(17,26)-(17,39)
(17,27)-(17,31)
(17,32)-(17,34)
(17,35)-(17,36)
(17,37)-(17,38)
(18,17)-(18,20)
(18,21)-(18,42)
(18,22)-(18,24)
(18,28)-(18,41)
(18,34)-(18,36)
(19,23)-(19,59)
(19,24)-(19,37)
(19,30)-(19,32)
(19,41)-(19,54)
(19,47)-(19,49)
(19,58)-(19,59)
(20,21)-(20,34)
(20,27)-(20,29)
(20,38)-(20,51)
(20,44)-(20,46)
(22,9)-(22,22)
(22,15)-(22,17)
(22,25)-(22,38)
(22,31)-(22,33)
(22,44)-(22,55)
(22,49)-(22,51)
(22,61)-(22,72)
(22,66)-(22,68)
*)

(* type error slice
(13,3)-(22,74)
(13,14)-(22,72)
(14,2)-(22,72)
(14,2)-(22,72)
(14,2)-(22,72)
(17,15)-(17,18)
(17,15)-(17,40)
(17,26)-(17,39)
(17,27)-(17,31)
(17,32)-(17,34)
(19,23)-(19,55)
(19,23)-(19,59)
(19,23)-(19,59)
*)
