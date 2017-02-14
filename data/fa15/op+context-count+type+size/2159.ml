
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
  | Average (i1,i2) -> (eval (i1, x, y)) +. ((eval (i2, x, y)) / 2)
  | Times (i1,i2) -> (eval (i1, x, y)) *. (eval (i2, x, y));;


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
  | Average (i1,i2) -> ((eval (i1, x, y)) +. (eval (i2, x, y))) /. 2.0
  | Times (i1,i2) -> (eval (i1, x, y)) *. (eval (i2, x, y));;

*)

(* changed spans
(19,25)-(19,67)
(19,47)-(19,67)
(19,66)-(19,67)
*)

(* type error slice
(17,20)-(17,40)
(17,27)-(17,31)
(17,27)-(17,40)
(19,25)-(19,67)
(19,47)-(19,51)
(19,47)-(19,61)
(19,47)-(19,67)
(19,47)-(19,67)
*)
