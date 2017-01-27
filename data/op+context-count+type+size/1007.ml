
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
  | Sine ex -> sin (exprToString ex);;


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
  | Sine ex -> "sin" ^ (exprToString ex);;

*)

(* changed spans
(15,16)-(15,19)
(15,16)-(15,36)
(15,21)-(15,36)
*)

(* type error slice
(11,4)-(15,39)
(11,22)-(15,36)
(12,3)-(15,36)
(12,9)-(12,10)
(13,14)-(13,17)
(15,16)-(15,19)
(15,16)-(15,36)
(15,21)-(15,33)
(15,21)-(15,36)
(15,34)-(15,36)
*)
