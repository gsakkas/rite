
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
  match e with | VarX  -> x | VarY  -> y | Sine e -> sin (pi *. (eval e));;


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
(14,71)-(14,72)
(e , 0.0 , 0.0)
TupleG [VarG,LitG,LitG]

*)

(* type error slice
(13,4)-(14,76)
(13,15)-(14,74)
(14,3)-(14,74)
(14,65)-(14,73)
(14,66)-(14,70)
(14,71)-(14,72)
*)
