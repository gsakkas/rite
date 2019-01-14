
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with | VarX  -> "x" | VarY  -> "y" | Sine ex -> sin exprToString ex;;


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
  | Sine ex -> "sin" ^ (exprToString ex);;

*)

(* changed spans
(12,58)-(12,61)
(^)
VarG

(12,62)-(12,74)
exprToString ex
AppG (fromList [VarG])

(12,62)-(12,74)
"sin"
LitG

*)
