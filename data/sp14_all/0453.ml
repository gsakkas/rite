
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
  | VarX  -> []
  | VarY  -> []
  | Sine e1 -> exprToString e1
  | Cosine e1 -> exprToString e1
  | Average (e1,e2) -> (exprToString e1) ^ (exprToString e2)
  | Times (e1,e2) -> (exprToString e1) ^ (exprToString e2)
  | Thresh (e1,e2,e3) ->
      (exprToString e1) ^ ((exprToString e2) ^ (exprToString e3));;


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
  | VarX  -> ""
  | VarY  -> ""
  | Sine e1 -> exprToString e1
  | Cosine e1 -> exprToString e1
  | Average (e1,e2) -> (exprToString e1) ^ (exprToString e2)
  | Times (e1,e2) -> (exprToString e1) ^ (exprToString e2)
  | Thresh (e1,e2,e3,e4) ->
      (exprToString e1) ^
        ((exprToString e2) ^ ((exprToString e3) ^ (exprToString e4)));;

*)

(* changed spans
(12,3)-(20,66)
match e with
| VarX -> ""
| VarY -> ""
| Sine e1 -> exprToString e1
| Cosine e1 -> exprToString e1
| Average (e1 , e2) -> exprToString e1 ^ exprToString e2
| Times (e1 , e2) -> exprToString e1 ^ exprToString e2
| Thresh (e1 , e2 , e3 , e4) -> exprToString e1 ^ (exprToString e2 ^ (exprToString e3 ^ exprToString e4))
CaseG VarG (fromList [(ConPatG Nothing,Nothing,LitG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(12,3)-(20,66)
(13,14)-(13,16)
(15,16)-(15,28)
(15,16)-(15,31)
(16,18)-(16,30)
(16,18)-(16,33)
(17,24)-(17,61)
(17,42)-(17,43)
(17,44)-(17,61)
(17,45)-(17,57)
(18,22)-(18,59)
(18,40)-(18,41)
(20,7)-(20,66)
(20,25)-(20,26)
*)
