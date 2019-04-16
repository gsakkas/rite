
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with | VarX  -> "x" | VarY  -> "y" | Sine i -> "sin" ^ i;;


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
  | Sine i -> "sin" ^ (exprToString i);;

*)

(* changed spans
(12,66)-(12,67)
exprToString i
AppG (fromList [VarG])

*)

(* type error slice
(12,3)-(12,67)
(12,58)-(12,67)
(12,64)-(12,65)
(12,66)-(12,67)
*)
