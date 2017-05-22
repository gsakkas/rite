
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
  | Sine e -> sin (pi *. (eval e))
  | Cosine e -> cos (pi *. (eval e))
  | Average (e1,e2) -> ((eval e1) +. (eval e2)) /. 2;;


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
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0;;

*)

(* changed spans
(17,31)-(17,32)
(18,16)-(18,36)
(18,33)-(18,34)
(19,23)-(19,52)
(19,30)-(19,32)
(19,37)-(19,46)
(19,43)-(19,45)
(19,51)-(19,52)
*)

(* type error slice
(13,3)-(19,54)
(13,14)-(19,52)
(14,2)-(19,52)
(17,25)-(17,33)
(17,26)-(17,30)
(17,31)-(17,32)
(19,23)-(19,52)
(19,51)-(19,52)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(19,52)
(14,2)-(19,52)
(14,8)-(14,9)
(15,13)-(15,14)
(16,13)-(16,14)
(17,14)-(17,34)
(17,14)-(17,17)
(17,18)-(17,34)
(17,19)-(17,21)
(17,25)-(17,33)
(17,26)-(17,30)
(17,31)-(17,32)
(18,16)-(18,36)
(18,16)-(18,19)
(18,20)-(18,36)
(18,21)-(18,23)
(18,27)-(18,35)
(18,28)-(18,32)
(18,33)-(18,34)
(19,23)-(19,52)
(19,23)-(19,47)
(19,24)-(19,33)
(19,25)-(19,29)
(19,30)-(19,32)
(19,37)-(19,46)
(19,38)-(19,42)
(19,43)-(19,45)
(19,51)-(19,52)
*)
