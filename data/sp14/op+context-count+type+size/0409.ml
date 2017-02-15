
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
  | Sine i -> sin (pi * (eval (i, x, y)))
  | Cosine i -> cos (pi * (eval (i, x, y)))
  | Average (i1,i2) -> ((eval (i1, x, y)) + (eval (i2, x, y))) / 2.0;;


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
  | Sine i -> sin (pi *. (eval (i, x, y)))
  | Cosine i -> cos (pi *. (eval (i, x, y)))
  | Average (i1,i2) -> ((eval (i1, x, y)) +. (eval (i2, x, y))) /. 2.0;;

*)

(* changed spans
(17,18)-(17,41)
(18,20)-(18,43)
(19,23)-(19,62)
(19,23)-(19,68)
(19,24)-(19,41)
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
(19,23)-(19,68)
(19,65)-(19,68)
*)
