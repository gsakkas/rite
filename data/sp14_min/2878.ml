
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
  | Sine e -> sin (pi *. (eval (e, 0, 0)));;


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
(17,36)-(17,37)
0.0
LitG

(17,39)-(17,40)
0.0
LitG

*)

(* type error slice
(13,4)-(17,45)
(13,15)-(17,43)
(14,3)-(17,43)
(16,14)-(16,15)
(17,15)-(17,18)
(17,15)-(17,43)
(17,26)-(17,42)
(17,27)-(17,31)
(17,32)-(17,41)
(17,39)-(17,40)
*)
