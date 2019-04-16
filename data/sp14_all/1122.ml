
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
  | Average (x',y') -> ((eval (VarX, x', y)) + (eval (VarY, x, y'))) / 2;;


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
(12,3)-(15,73)
match e with
| Average (x' , y') -> (x +. y) /. 2.0
CaseG VarG (fromList [(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,BopG EmptyG EmptyG)])

*)

(* type error slice
(11,4)-(15,75)
(11,15)-(15,73)
(12,3)-(15,73)
(13,14)-(13,15)
(15,24)-(15,69)
(15,24)-(15,73)
(15,25)-(15,45)
(15,26)-(15,30)
(15,31)-(15,44)
(15,38)-(15,40)
(15,48)-(15,68)
(15,49)-(15,53)
(15,54)-(15,67)
(15,61)-(15,62)
*)
