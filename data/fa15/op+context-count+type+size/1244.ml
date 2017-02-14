
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (eval e)
  | Cosine e -> cos (eval e)
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
(11,15)-(20,65)
(15,20)-(15,26)
(15,25)-(15,26)
(16,17)-(16,28)
(16,22)-(16,28)
(16,27)-(16,28)
(17,26)-(17,30)
(17,26)-(17,33)
(17,26)-(17,45)
(17,26)-(17,51)
(17,31)-(17,33)
(17,38)-(17,42)
(17,38)-(17,45)
(17,43)-(17,45)
(17,50)-(17,51)
(18,23)-(18,30)
(18,23)-(18,42)
(18,28)-(18,30)
(18,35)-(18,42)
(18,40)-(18,42)
(20,7)-(20,65)
(20,11)-(20,15)
(20,11)-(20,18)
(20,11)-(20,30)
(20,16)-(20,18)
(20,23)-(20,27)
(20,23)-(20,30)
(20,28)-(20,30)
(20,37)-(20,41)
(20,37)-(20,48)
(20,42)-(20,48)
(20,54)-(20,58)
(20,54)-(20,65)
(20,59)-(20,65)
*)

(* type error slice
(11,4)-(20,67)
(11,15)-(20,65)
(12,3)-(20,65)
(12,3)-(20,65)
(12,3)-(20,65)
(12,3)-(20,65)
(15,15)-(15,18)
(15,15)-(15,26)
(15,20)-(15,24)
(15,20)-(15,26)
(15,25)-(15,26)
(17,26)-(17,30)
(17,26)-(17,33)
(17,26)-(17,45)
(17,26)-(17,45)
(17,26)-(17,51)
(17,38)-(17,42)
(17,38)-(17,45)
(18,23)-(18,27)
(18,23)-(18,30)
(18,23)-(18,42)
(18,23)-(18,42)
(18,23)-(18,42)
(18,35)-(18,39)
(18,35)-(18,42)
*)
