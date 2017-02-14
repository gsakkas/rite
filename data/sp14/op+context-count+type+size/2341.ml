
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
  | Average (e1,e2) -> ((e1 * 1.00) +. (e2 * 1.00)) /. 2.0;;


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
(14,3)-(19,59)
(19,26)-(19,28)
(19,26)-(19,35)
(19,31)-(19,35)
(19,41)-(19,43)
(19,41)-(19,50)
(19,46)-(19,50)
(19,56)-(19,59)
*)

(* type error slice
(14,3)-(19,59)
(14,3)-(19,59)
(19,26)-(19,28)
(19,26)-(19,35)
(19,26)-(19,35)
(19,26)-(19,35)
(19,26)-(19,50)
(19,26)-(19,50)
(19,31)-(19,35)
(19,41)-(19,43)
(19,41)-(19,50)
(19,41)-(19,50)
(19,41)-(19,50)
(19,46)-(19,50)
*)
