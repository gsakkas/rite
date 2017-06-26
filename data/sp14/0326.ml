
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
(15,14)-(15,24)
(15,14)-(15,43)
*)

(* type error slice
(11,3)-(15,45)
(11,21)-(15,43)
(12,2)-(15,43)
(13,13)-(13,16)
(15,14)-(15,24)
(15,14)-(15,43)
(15,27)-(15,43)
(15,28)-(15,40)
*)

(* all spans
(11,21)-(15,43)
(12,2)-(15,43)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,14)-(15,43)
(15,14)-(15,24)
(15,27)-(15,43)
(15,28)-(15,40)
(15,41)-(15,42)
*)
