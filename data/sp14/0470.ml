
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
(12,62)-(12,74)
*)

(* type error slice
(12,58)-(12,61)
(12,58)-(12,77)
*)

(* all spans
(11,21)-(12,77)
(12,2)-(12,77)
(12,8)-(12,9)
(12,26)-(12,29)
(12,41)-(12,44)
(12,58)-(12,77)
(12,58)-(12,61)
(12,62)-(12,74)
(12,75)-(12,77)
*)
