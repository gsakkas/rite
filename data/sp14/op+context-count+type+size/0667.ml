
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let a = (1, 2);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi * (eval (a, x, y)))
  | Cosine a -> x
  | Average (a,b) -> x
  | Times (a,b) -> x
  | Thresh (a,b,c,d) -> x;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let a = (1, 2);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (eval (a, x, y))
  | Cosine a -> x
  | Average (a,b) -> x
  | Times (a,b) -> x
  | Thresh (a,b,c,d) -> x;;

*)

(* changed spans
(13,9)-(13,12)
(13,9)-(13,26)
(13,16)-(13,26)
(13,17)-(13,21)
(13,22)-(13,25)
(19,18)-(19,41)
(19,19)-(19,21)
*)

(* type error slice
(13,3)-(13,28)
(13,9)-(13,26)
(19,14)-(19,17)
(19,14)-(19,41)
(19,18)-(19,41)
(19,18)-(19,41)
(19,19)-(19,21)
*)
