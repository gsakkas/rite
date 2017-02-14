
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
  match e with | VarX  -> x | VarY  -> y | Sine e1 -> sin x;;

*)

(* changed spans
(12,60)-(12,64)
(12,60)-(12,67)
(12,65)-(12,67)
*)

(* type error slice
(11,4)-(12,70)
(11,15)-(12,67)
(12,3)-(12,67)
(12,60)-(12,64)
(12,60)-(12,67)
(12,65)-(12,67)
*)
