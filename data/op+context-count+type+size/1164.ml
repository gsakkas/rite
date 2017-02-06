
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
  | Sine e -> "sin (pi*" + (exprToString e);;


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
  | Sine e -> "sin (pi*" ^ (exprToString e);;

*)

(* changed spans
(15,15)-(15,25)
(15,15)-(15,43)
*)

(* type error slice
(11,22)-(15,43)
(12,3)-(15,43)
(12,3)-(15,43)
(12,3)-(15,43)
(12,3)-(15,43)
(12,3)-(15,43)
(12,3)-(15,43)
(12,3)-(15,43)
(12,9)-(12,10)
(13,14)-(13,17)
(14,14)-(14,17)
(15,15)-(15,25)
(15,15)-(15,43)
(15,15)-(15,43)
(15,15)-(15,43)
(15,29)-(15,41)
(15,29)-(15,43)
(15,29)-(15,43)
(15,42)-(15,43)
*)
