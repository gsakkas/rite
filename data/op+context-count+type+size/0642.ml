
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
*)

(* type error slice
(13,4)-(14,76)
(13,15)-(14,72)
(14,3)-(14,72)
(14,9)-(14,10)
(14,27)-(14,28)
(14,40)-(14,41)
(14,54)-(14,57)
(14,54)-(14,72)
(14,59)-(14,72)
(14,66)-(14,70)
(14,66)-(14,72)
(14,71)-(14,72)
*)
