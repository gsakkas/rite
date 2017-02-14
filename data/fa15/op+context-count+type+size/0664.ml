
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) = match (e, x, y) with | VarX  -> x | VarY  -> y;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) = match e with | VarX  -> x | VarY  -> y;;

*)

(* changed spans
(11,31)-(11,38)
(11,56)-(11,57)
(11,69)-(11,70)
*)

(* type error slice
(11,24)-(11,70)
(11,24)-(11,70)
(11,24)-(11,70)
(11,24)-(11,70)
(11,31)-(11,38)
*)
