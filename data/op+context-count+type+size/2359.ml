
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
  | Sine e -> pi *. x
  | Cosine e -> pi *. y
  | Average (e1,e2) -> ((e1 * 1.00) + (e2 * 1.00)) /. 2.0;;


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
  | Sine e -> pi *. x
  | Cosine e -> pi *. y
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y));;

*)

(* changed spans
(14,3)-(19,58)
(19,26)-(19,28)
(19,26)-(19,35)
(19,26)-(19,49)
(19,31)-(19,35)
(19,40)-(19,42)
(19,40)-(19,49)
(19,45)-(19,49)
(19,55)-(19,58)
*)

(* type error slice
(13,4)-(19,60)
(13,15)-(19,58)
(14,3)-(19,58)
(14,3)-(19,58)
(14,9)-(14,10)
(15,14)-(15,15)
(16,14)-(16,15)
(17,21)-(17,22)
(18,23)-(18,24)
(19,26)-(19,28)
(19,26)-(19,35)
(19,26)-(19,35)
(19,26)-(19,35)
(19,26)-(19,49)
(19,26)-(19,58)
(19,31)-(19,35)
(19,40)-(19,42)
(19,40)-(19,49)
(19,40)-(19,49)
(19,45)-(19,49)
(19,55)-(19,58)
*)
