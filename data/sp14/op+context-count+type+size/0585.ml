
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
(17,35)-(17,36)
(17,38)-(17,39)
*)

(* type error slice
(13,3)-(17,44)
(13,14)-(17,42)
(14,2)-(17,42)
(16,13)-(16,14)
(17,18)-(17,42)
(17,25)-(17,41)
(17,26)-(17,30)
(17,31)-(17,40)
(17,38)-(17,39)
*)
