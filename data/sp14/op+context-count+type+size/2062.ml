
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
(12,2)-(12,57)
(12,37)-(12,49)
(12,37)-(12,57)
(12,50)-(12,51)
(12,52)-(12,53)
(12,54)-(12,55)
(12,56)-(12,57)
*)

(* type error slice
(11,3)-(12,59)
(11,21)-(12,57)
(12,2)-(12,57)
(12,37)-(12,49)
(12,37)-(12,57)
*)
