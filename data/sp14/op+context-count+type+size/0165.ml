
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
  | Average (x',y') -> ((eval x' y) + (eval x y')) / 2;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) = match e with | Average (x',y') -> (x +. y) /. 2.0;;

*)

(* changed spans
(12,3)-(15,55)
(13,14)-(13,15)
(15,26)-(15,30)
(15,26)-(15,35)
(15,26)-(15,49)
(15,26)-(15,55)
(15,31)-(15,33)
(15,34)-(15,35)
(15,40)-(15,49)
(15,54)-(15,55)
*)

(* type error slice
(11,4)-(15,57)
(11,15)-(15,55)
(12,3)-(15,55)
(12,3)-(15,55)
(12,3)-(15,55)
(13,14)-(13,15)
(15,26)-(15,30)
(15,26)-(15,35)
(15,26)-(15,55)
(15,31)-(15,33)
(15,40)-(15,44)
(15,40)-(15,49)
(15,45)-(15,46)
*)
