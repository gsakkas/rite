
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
  | VarX  -> 1.0
  | VarY  -> 1.0
  | Sine e1 -> sin (2 * (eval (e1, x, y)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with | VarX  -> x | VarY  -> y | Sine e1 -> sin (eval (e1, x, y));;

*)

(* changed spans
(13,14)-(13,17)
(14,14)-(14,17)
(15,16)-(15,40)
(15,21)-(15,22)
(15,21)-(15,40)
*)

(* type error slice
(11,4)-(15,45)
(11,15)-(15,40)
(12,3)-(15,40)
(12,3)-(15,40)
(12,3)-(15,40)
(12,3)-(15,40)
(12,3)-(15,40)
(12,3)-(15,40)
(12,9)-(12,10)
(13,14)-(13,17)
(14,14)-(14,17)
(15,16)-(15,19)
(15,16)-(15,40)
(15,16)-(15,40)
(15,21)-(15,22)
(15,21)-(15,40)
(15,21)-(15,40)
(15,26)-(15,30)
(15,26)-(15,40)
(15,26)-(15,40)
(15,32)-(15,34)
(15,32)-(15,40)
(15,36)-(15,37)
(15,39)-(15,40)
*)
