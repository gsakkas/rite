
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e = match e with | VarX  -> "%s" VarX;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e = match e with | VarX  -> "VarX";;

*)

(* changed spans
(11,49)-(11,53)
(11,49)-(11,58)
(11,54)-(11,58)
*)

(* type error slice
(11,49)-(11,53)
(11,49)-(11,58)
*)
