
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
(19,22)-(19,65)
(eval (m , x , y) +. eval (n , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

*)

(* type error slice
(14,3)-(19,65)
(17,15)-(17,18)
(17,15)-(17,43)
(19,22)-(19,60)
(19,22)-(19,65)
(19,63)-(19,65)
*)
