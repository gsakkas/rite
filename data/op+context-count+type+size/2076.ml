
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with | Thresh (a,b,c,d) -> exprToString a b c d;;


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
  | Sine e -> "sin (pi*" ^ ((exprToString e) ^ ")");;

*)

(* changed spans
(12,3)-(12,58)
(12,38)-(12,50)
(12,38)-(12,58)
(12,51)-(12,52)
(12,53)-(12,54)
(12,55)-(12,56)
(12,57)-(12,58)
*)

(* type error slice
(11,4)-(12,60)
(11,22)-(12,58)
(12,3)-(12,58)
(12,9)-(12,10)
(12,38)-(12,50)
(12,38)-(12,58)
*)
