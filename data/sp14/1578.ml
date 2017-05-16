
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) = match e with | VarX  -> x * 1.0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) = match e with | VarX  -> x;;

*)

(* changed spans
(11,47)-(11,54)
(11,51)-(11,54)
*)

(* type error slice
(11,47)-(11,54)
(11,51)-(11,54)
*)

(* all spans
(11,14)-(11,54)
(11,23)-(11,54)
(11,29)-(11,30)
(11,47)-(11,54)
(11,47)-(11,48)
(11,51)-(11,54)
*)
