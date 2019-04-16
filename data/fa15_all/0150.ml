
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> 0
  | VarY  -> 1
  | Sine e1 -> exprToString e1
  | Cosine e1 -> exprToString e1
  | Average (e1,e2) -> ((exprToString e1) +. (exprToString e2)) / 2;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> exprToString e1
  | Cosine e1 -> exprToString e1
  | Average (e1,e2) -> ((exprToString e1) ^ ("+" ^ (exprToString e2))) ^ "/2"
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) -> (exprToString e1) ^ ("+" ^ (exprToString e2));;

*)

(* changed spans
(12,3)-(17,68)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine e1 -> exprToString e1
| Cosine e1 -> exprToString e1
| Average (e1 , e2) -> (exprToString e1 ^ ("+" ^ exprToString e2)) ^ "/2"
| Times (e1 , e2) -> exprToString e1 ^ ("*" ^ exprToString e2)
| Thresh (e1 , e2 , e3 , e4) -> exprToString e1 ^ ("+" ^ exprToString e2)
CaseG VarG (fromList [(ConPatG Nothing,Nothing,LitG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(12,3)-(17,68)
(13,14)-(13,15)
(15,16)-(15,28)
(15,16)-(15,31)
(16,18)-(16,30)
(16,18)-(16,33)
(17,24)-(17,64)
(17,24)-(17,68)
(17,25)-(17,42)
(17,26)-(17,38)
*)
