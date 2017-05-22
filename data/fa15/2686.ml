
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
(12,65)-(12,66)
*)

(* type error slice
(12,2)-(12,66)
(12,57)-(12,66)
(12,63)-(12,64)
(12,65)-(12,66)
*)

(* all spans
(11,21)-(12,66)
(12,2)-(12,66)
(12,8)-(12,9)
(12,26)-(12,29)
(12,41)-(12,44)
(12,57)-(12,66)
(12,63)-(12,64)
(12,57)-(12,62)
(12,65)-(12,66)
*)
