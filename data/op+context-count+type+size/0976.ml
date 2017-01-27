
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with | VarX  -> x | VarY  -> y | Sine e1 -> sin (eval e);;


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
(12,65)-(12,66)
*)

(* type error slice
(11,4)-(12,69)
(11,15)-(12,66)
(12,3)-(12,66)
(12,9)-(12,10)
(12,27)-(12,28)
(12,40)-(12,41)
(12,55)-(12,58)
(12,55)-(12,66)
(12,60)-(12,64)
(12,60)-(12,66)
(12,65)-(12,66)
*)
