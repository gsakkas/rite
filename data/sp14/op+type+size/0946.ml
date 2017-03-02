
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
  | Sine ex -> sin (pi *. (eval ex x y));;


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
  | Sine ex -> sin (pi *. (eval (ex, x, y)));;

*)

(* changed spans
(17,26)-(17,39)
(17,32)-(17,34)
*)

(* type error slice
(13,3)-(17,42)
(13,14)-(17,40)
(14,2)-(17,40)
(17,26)-(17,39)
(17,27)-(17,31)
(17,32)-(17,34)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(17,40)
(14,2)-(17,40)
(14,8)-(14,9)
(15,13)-(15,14)
(16,13)-(16,14)
(17,15)-(17,40)
(17,15)-(17,18)
(17,19)-(17,40)
(17,20)-(17,22)
(17,26)-(17,39)
(17,27)-(17,31)
(17,32)-(17,34)
(17,35)-(17,36)
(17,37)-(17,38)
*)
