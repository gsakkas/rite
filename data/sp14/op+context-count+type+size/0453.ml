
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
(17,20)-(17,39)
(18,22)-(18,41)
(19,26)-(19,40)
(19,26)-(19,60)
(19,26)-(19,69)
*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,26)
(17,15)-(17,18)
(17,15)-(17,39)
(17,20)-(17,22)
(17,20)-(17,39)
(17,20)-(17,39)
(18,17)-(18,20)
(18,17)-(18,41)
(18,22)-(18,24)
(18,22)-(18,41)
(18,22)-(18,41)
(19,26)-(19,69)
(19,66)-(19,69)
*)
