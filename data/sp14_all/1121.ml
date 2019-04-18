
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
match e with
| Average (x' , y') -> (x +. y) /. 2.0
CaseG (fromList [(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,BopG EmptyG EmptyG)])

(13,14)-(13,15)
(x +. y) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

*)

(* type error slice
(11,4)-(15,67)
(11,15)-(15,65)
(12,3)-(15,65)
(13,14)-(13,15)
(15,24)-(15,65)
(15,25)-(15,41)
(15,26)-(15,30)
(15,31)-(15,35)
(15,36)-(15,38)
(15,44)-(15,60)
(15,45)-(15,49)
(15,55)-(15,56)
*)
