
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
(13,13)-(13,16)
(14,13)-(14,16)
(15,15)-(15,42)
(15,19)-(15,42)
(15,20)-(15,21)
*)

(* type error slice
(11,3)-(15,44)
(11,14)-(15,42)
(12,2)-(15,42)
(13,13)-(13,16)
(15,15)-(15,18)
(15,15)-(15,42)
(15,19)-(15,42)
(15,24)-(15,41)
(15,25)-(15,29)
*)

(* all spans
(11,14)-(15,42)
(12,2)-(15,42)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,15)-(15,42)
(15,15)-(15,18)
(15,19)-(15,42)
(15,20)-(15,21)
(15,24)-(15,41)
(15,25)-(15,29)
(15,30)-(15,40)
(15,31)-(15,33)
(15,35)-(15,36)
(15,38)-(15,39)
*)
