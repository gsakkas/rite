
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
  | Average (x',y') -> ((eval VarX x' y) + (eval VarY x y')) / 2;;


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
(12,3)-(15,65)
(13,14)-(13,15)
(15,26)-(15,30)
(15,26)-(15,40)
(15,26)-(15,59)
(15,26)-(15,65)
(15,31)-(15,35)
(15,36)-(15,38)
(15,39)-(15,40)
(15,45)-(15,59)
(15,64)-(15,65)
*)

(* type error slice
(11,4)-(15,67)
(11,15)-(15,65)
(12,3)-(15,65)
(12,3)-(15,65)
(12,3)-(15,65)
(13,14)-(13,15)
(15,26)-(15,30)
(15,26)-(15,40)
(15,26)-(15,65)
(15,31)-(15,35)
(15,36)-(15,38)
(15,45)-(15,49)
(15,45)-(15,59)
(15,55)-(15,56)
*)
