
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
  | Sine e -> sin (pi * (eval (e, x, y)))
  | Cosine e -> cos (pi * (eval (e, x, y)));;


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
  | Cosine e -> cos (pi *. (eval (e, x, y)));;

*)

(* changed spans
(17,18)-(17,41)
(18,20)-(18,43)
*)

(* type error slice
(11,3)-(11,28)
(11,9)-(11,26)
(17,14)-(17,17)
(17,14)-(17,41)
(17,18)-(17,41)
(17,19)-(17,21)
(18,16)-(18,19)
(18,16)-(18,43)
(18,20)-(18,43)
(18,21)-(18,23)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(18,43)
(14,2)-(18,43)
(14,8)-(14,9)
(15,13)-(15,14)
(16,13)-(16,14)
(17,14)-(17,41)
(17,14)-(17,17)
(17,18)-(17,41)
(17,19)-(17,21)
(17,24)-(17,40)
(17,25)-(17,29)
(17,30)-(17,39)
(17,31)-(17,32)
(17,34)-(17,35)
(17,37)-(17,38)
(18,16)-(18,43)
(18,16)-(18,19)
(18,20)-(18,43)
(18,21)-(18,23)
(18,26)-(18,42)
(18,27)-(18,31)
(18,32)-(18,41)
(18,33)-(18,34)
(18,36)-(18,37)
(18,39)-(18,40)
*)
