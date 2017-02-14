
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
(11,14)-(20,64)
(15,18)-(15,26)
(15,24)-(15,25)
(16,16)-(16,28)
(16,20)-(16,28)
(16,26)-(16,27)
(17,23)-(17,46)
(17,23)-(17,50)
(17,24)-(17,33)
(17,25)-(17,29)
(17,30)-(17,32)
(17,36)-(17,45)
(17,37)-(17,41)
(17,42)-(17,44)
(17,49)-(17,50)
(18,21)-(18,30)
(18,21)-(18,42)
(18,27)-(18,29)
(18,33)-(18,42)
(18,39)-(18,41)
(20,6)-(20,64)
(20,9)-(20,18)
(20,9)-(20,30)
(20,10)-(20,14)
(20,15)-(20,17)
(20,21)-(20,30)
(20,22)-(20,26)
(20,27)-(20,29)
(20,36)-(20,40)
(20,36)-(20,47)
(20,41)-(20,47)
(20,53)-(20,57)
(20,53)-(20,64)
(20,58)-(20,64)
*)

(* type error slice
(11,3)-(20,66)
(11,14)-(20,64)
(12,2)-(20,64)
(12,2)-(20,64)
(12,2)-(20,64)
(12,2)-(20,64)
(15,14)-(15,17)
(15,14)-(15,26)
(15,18)-(15,26)
(15,19)-(15,23)
(15,24)-(15,25)
(17,23)-(17,46)
(17,23)-(17,46)
(17,23)-(17,50)
(17,24)-(17,33)
(17,25)-(17,29)
(17,36)-(17,45)
(17,37)-(17,41)
(18,21)-(18,30)
(18,21)-(18,42)
(18,21)-(18,42)
(18,21)-(18,42)
(18,22)-(18,26)
(18,33)-(18,42)
(18,34)-(18,38)
*)
