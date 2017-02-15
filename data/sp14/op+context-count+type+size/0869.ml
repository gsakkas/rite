
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with | VarX  -> x | VarY  -> y | Sine e1 -> sin (eval e1);;


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
(12,64)-(12,66)
*)

(* type error slice
(11,3)-(12,69)
(11,14)-(12,67)
(12,2)-(12,67)
(12,58)-(12,67)
(12,59)-(12,63)
(12,64)-(12,66)
*)
