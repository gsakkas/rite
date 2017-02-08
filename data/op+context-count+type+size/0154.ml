
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
(14,3)-(22,73)
(17,28)-(17,32)
(17,28)-(17,39)
(17,33)-(17,35)
(17,36)-(17,37)
(17,38)-(17,39)
(18,18)-(18,21)
(18,23)-(18,25)
(18,23)-(18,41)
(18,30)-(18,41)
(18,35)-(18,37)
(19,26)-(19,37)
(19,26)-(19,60)
(19,31)-(19,33)
(19,43)-(19,54)
(19,48)-(19,50)
(19,59)-(19,60)
(20,23)-(20,34)
(20,28)-(20,30)
(20,40)-(20,51)
(20,45)-(20,47)
(22,11)-(22,22)
(22,16)-(22,18)
(22,27)-(22,38)
(22,32)-(22,34)
(22,45)-(22,56)
(22,50)-(22,52)
(22,62)-(22,73)
(22,67)-(22,69)
*)

(* type error slice
(13,4)-(22,75)
(13,15)-(22,73)
(14,3)-(22,73)
(14,3)-(22,73)
(14,3)-(22,73)
(17,16)-(17,19)
(17,16)-(17,39)
(17,28)-(17,32)
(17,28)-(17,39)
(17,33)-(17,35)
(19,26)-(19,54)
(19,26)-(19,60)
(19,26)-(19,60)
*)
