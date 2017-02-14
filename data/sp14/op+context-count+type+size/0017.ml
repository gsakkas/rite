
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
  | Sine m -> sin (pi *. (eval (m, x, y)))
  | Cosine m -> cos (pi *. (eval (m, x, y)))
  | Average (m,n) -> ((eval (m, x, y)) +. (eval (n, x, y))) / 2.;;


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
  | Sine m -> sin (pi *. (eval (m, x, y)))
  | Cosine m -> cos (pi *. (eval (m, x, y)))
  | Average (m,n) -> ((eval (m, x, y)) +. (eval (n, x, y))) /. 2.;;

*)

(* changed spans
(19,21)-(19,64)
*)

(* type error slice
(14,2)-(19,64)
(14,2)-(19,64)
(17,14)-(17,17)
(17,14)-(17,42)
(19,21)-(19,59)
(19,21)-(19,64)
(19,21)-(19,64)
(19,21)-(19,64)
(19,62)-(19,64)
*)
