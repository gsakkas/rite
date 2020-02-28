
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let a = (1, 2);;

let buildX () = VarX;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (eval ((buildX ()), a, y))
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
(19,26)-(19,37)
a
VarG

(19,39)-(19,40)
x
VarG

*)

(* type error slice
(15,4)-(23,28)
(15,15)-(23,26)
(16,3)-(23,26)
(17,14)-(17,15)
(19,15)-(19,18)
(19,15)-(19,45)
(19,19)-(19,45)
(19,20)-(19,24)
(19,25)-(19,44)
(19,39)-(19,40)
*)
