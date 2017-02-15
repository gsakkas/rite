
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
  | Thresh (a,b,c,d) -> eval (a, x, y)
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Average (a,b) -> ((eval (a, x, y)) *. (eval (b, x, y))) /. 2.0
  | Cosine a -> cos (pi * (eval (a, x, y)))
  | Sine a -> sin (pi * (eval (a, x, y)))
  | VarY  -> x
  | VarX  -> y;;


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
  | Thresh (a,b,c,d) -> eval (a, x, y)
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Average (a,b) -> ((eval (a, x, y)) *. (eval (b, x, y))) /. 2.0
  | Cosine a -> cos (pi ** (eval (a, x, y)))
  | Sine a -> sin (pi ** (eval (a, x, y)))
  | VarY  -> x
  | VarX  -> y;;

*)

(* changed spans
(18,20)-(18,43)
(18,21)-(18,23)
(19,18)-(19,41)
(19,19)-(19,21)
*)

(* type error slice
(11,3)-(11,28)
(11,9)-(11,26)
(16,19)-(16,35)
(16,19)-(16,55)
(16,20)-(16,24)
(18,16)-(18,19)
(18,16)-(18,43)
(18,20)-(18,43)
(18,20)-(18,43)
(18,20)-(18,43)
(18,21)-(18,23)
(18,26)-(18,42)
(18,27)-(18,31)
(19,14)-(19,17)
(19,14)-(19,41)
(19,18)-(19,41)
(19,18)-(19,41)
(19,24)-(19,40)
(19,25)-(19,29)
*)
