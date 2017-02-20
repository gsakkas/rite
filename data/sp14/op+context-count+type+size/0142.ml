
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) = match e with | Average (x',y') -> (x +. y) /. 2;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) = match e with | Average (x',y') -> (x +. y) /. 2.0;;

*)

(* changed spans
(11,69)-(11,70)
*)

(* type error slice
(11,57)-(11,70)
(11,69)-(11,70)
*)

(* all spans
(11,14)-(11,70)
(11,23)-(11,70)
(11,29)-(11,30)
(11,57)-(11,70)
(11,57)-(11,65)
(11,58)-(11,59)
(11,63)-(11,64)
(11,69)-(11,70)
*)
