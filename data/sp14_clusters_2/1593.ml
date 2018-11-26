
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
  | Sine  -> VarY ^ ("/" ^ VarX)
  | Cosine  -> VarX ^ ("/" ^ VarY);;


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
  | Sine e -> exprToString e
  | Cosine e -> exprToString e;;

*)

(* changed spans
(12,2)-(16,34)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine e -> exprToString e
| Cosine e -> exprToString e
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

(16,29)-(16,33)
exprToString e
AppG (fromList [VarG])

*)
