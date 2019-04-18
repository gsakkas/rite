
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
  | Sine  -> VarY @ ("/" @ VarX)
  | Cosine  -> VarX @ ("/" @ VarY);;


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
(12,3)-(16,35)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine e -> exprToString e
| Cosine e -> exprToString e
CaseG (fromList [(ConPatG Nothing,Nothing,LitG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG]))])

(15,14)-(15,33)
exprToString e
AppG (fromList [VarG])

(16,16)-(16,35)
exprToString e
AppG (fromList [VarG])

*)

(* type error slice
(15,14)-(15,18)
(15,14)-(15,33)
(15,19)-(15,20)
(15,21)-(15,33)
(15,22)-(15,25)
(15,26)-(15,27)
(16,16)-(16,20)
(16,16)-(16,35)
(16,21)-(16,22)
(16,23)-(16,35)
(16,24)-(16,27)
(16,28)-(16,29)
*)
