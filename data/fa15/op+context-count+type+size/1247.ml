
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
  | Sine e -> sin (pi * (eval e))
  | Cosine e -> cos (pi * (eval e))
  | Average (e1,e2) -> ((eval e1) + (eval e2)) / 2
  | Times (e1,e2) -> (eval e1) * (eval e2)
  | Thresh (e1,e2,e1less,e2less) ->
      if (eval e1) < (eval e2) then eval e1less else eval e2less;;


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
  | Thresh (e1,e2,e1less,e2less) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e1less, x, y)
      else eval (e2less, x, y);;

*)

(* changed spans
(17,20)-(17,32)
(17,31)-(17,32)
(18,17)-(18,34)
(18,22)-(18,34)
(18,33)-(18,34)
(19,26)-(19,33)
(19,26)-(19,45)
(19,26)-(19,51)
(19,31)-(19,33)
(19,38)-(19,45)
(19,43)-(19,45)
(19,50)-(19,51)
(20,23)-(20,30)
(20,23)-(20,42)
(20,28)-(20,30)
(20,35)-(20,42)
(20,40)-(20,42)
(22,11)-(22,15)
(22,11)-(22,18)
(22,11)-(22,30)
(22,16)-(22,18)
(22,23)-(22,27)
(22,23)-(22,30)
(22,28)-(22,30)
(22,37)-(22,41)
(22,37)-(22,48)
(22,42)-(22,48)
(22,54)-(22,58)
(22,54)-(22,65)
(22,59)-(22,65)
*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,26)
(14,3)-(22,65)
(14,3)-(22,65)
(17,15)-(17,18)
(17,15)-(17,32)
(17,20)-(17,22)
(17,20)-(17,32)
(17,20)-(17,32)
(18,17)-(18,20)
(18,17)-(18,34)
(18,22)-(18,24)
(18,22)-(18,34)
(18,22)-(18,34)
(19,26)-(19,51)
*)
