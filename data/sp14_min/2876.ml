
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
  match e with | VarX  -> x | VarY  -> y | Sine e -> sin (pi * (eval e));;


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
  | Sine e -> sin (pi *. (eval (e, 0.0, 0.0)));;

*)

(* changed spans
(14,58)-(14,73)
pi *. eval (e , 0.0 , 0.0)
BopG VarG (AppG [EmptyG])

*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,27)
(13,4)-(14,75)
(13,15)-(14,73)
(14,3)-(14,73)
(14,54)-(14,57)
(14,54)-(14,73)
(14,58)-(14,73)
(14,59)-(14,61)
(14,64)-(14,72)
(14,65)-(14,69)
(14,70)-(14,71)
*)
