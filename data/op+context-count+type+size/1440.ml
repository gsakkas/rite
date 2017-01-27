
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (eval (a, x, y))
  | Cosine a -> cos (eval (a, x, y))
  | Average (a,b) -> ((eval (a, x, y)), (eval (b, x, y))) / 2;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (eval (a, x, y))
  | Cosine a -> cos (eval (a, x, y))
  | Average (a,b) -> (eval (a, x, y)) +. (eval (b, x, y));;

*)

(* changed spans
(17,24)-(17,55)
(17,24)-(17,62)
(17,61)-(17,62)
*)

(* type error slice
(12,3)-(17,62)
(13,14)-(13,15)
(15,20)-(15,24)
(15,20)-(15,33)
(15,26)-(15,27)
(15,26)-(15,33)
(15,29)-(15,30)
(15,32)-(15,33)
(17,24)-(17,28)
(17,24)-(17,37)
(17,24)-(17,55)
(17,24)-(17,62)
(17,30)-(17,31)
(17,30)-(17,37)
(17,33)-(17,34)
(17,36)-(17,37)
(17,42)-(17,46)
(17,42)-(17,55)
(17,48)-(17,49)
(17,48)-(17,55)
(17,51)-(17,52)
(17,54)-(17,55)
*)
