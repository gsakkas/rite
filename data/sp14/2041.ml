
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with | VarX  -> "x" | VarY  -> "y" | Sine m -> "sin" ^ exprToString;;


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
  | Sine m -> "sin" ^ (exprToString m);;

*)

(* changed spans
(12,66)-(12,78)
exprToString m
AppG [VarG]

*)

(* type error slice
(11,4)-(12,80)
(11,22)-(12,78)
(12,58)-(12,78)
(12,64)-(12,65)
(12,66)-(12,78)
*)
