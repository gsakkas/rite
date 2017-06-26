
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
(11,29)-(11,38)
(11,55)-(11,56)
(11,68)-(11,69)
*)

(* type error slice
(11,23)-(11,69)
(11,29)-(11,38)
*)

(* all spans
(11,14)-(11,69)
(11,23)-(11,69)
(11,29)-(11,38)
(11,30)-(11,31)
(11,33)-(11,34)
(11,36)-(11,37)
(11,55)-(11,56)
(11,68)-(11,69)
*)
