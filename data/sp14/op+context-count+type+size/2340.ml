
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with | VarX  -> x | VarY  -> y | Sine e -> pi * e;;


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
(11,9)-(11,12)
(11,9)-(11,26)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
*)

(* type error slice
(11,3)-(11,28)
(11,9)-(11,26)
(14,2)-(14,59)
(14,53)-(14,55)
(14,53)-(14,59)
(14,53)-(14,59)
(14,58)-(14,59)
*)
