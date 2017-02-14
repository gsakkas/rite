
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with | VarX  -> x | VarY  -> y | Sine e1 -> sin (eval e x y);;


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
(12,60)-(12,70)
(12,65)-(12,66)
(12,69)-(12,70)
*)

(* type error slice
(11,4)-(12,73)
(11,15)-(12,70)
(12,60)-(12,64)
(12,60)-(12,70)
(12,65)-(12,66)
*)
