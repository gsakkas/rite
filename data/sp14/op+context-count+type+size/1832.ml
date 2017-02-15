
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
  | Sine e -> sin (pi * (eval (e, x, y)))
  | Cosine e -> cos (pi * (eval (e, x, y)));;


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
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)));;

*)

(* changed spans
(17,18)-(17,41)
(18,20)-(18,43)
*)

(* type error slice
(11,3)-(11,28)
(11,9)-(11,26)
(17,14)-(17,17)
(17,14)-(17,41)
(17,18)-(17,41)
(17,18)-(17,41)
(17,19)-(17,21)
(18,16)-(18,19)
(18,16)-(18,43)
(18,20)-(18,43)
(18,20)-(18,43)
(18,21)-(18,23)
*)
