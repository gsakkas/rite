
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
  | Sine e1 -> Sine ^ (exprToString e1);;


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
  | Sine e1 -> "Sin(" ^ ((exprToString e1) ^ ")");;

*)

(* changed spans
(15,15)-(15,19)
(15,22)-(15,39)
*)

(* type error slice
(15,15)-(15,19)
(15,15)-(15,39)
(15,20)-(15,21)
*)

(* all spans
(11,21)-(15,39)
(12,2)-(15,39)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,15)-(15,39)
(15,20)-(15,21)
(15,15)-(15,19)
(15,22)-(15,39)
(15,23)-(15,35)
(15,36)-(15,38)
*)
