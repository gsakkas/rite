
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
  | Sine x -> "sin(" @ ((exprToString x) @ ")");;


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
  | Sine x -> "sin(" ^ ((exprToString x) ^ ")");;

*)

(* changed spans
(15,21)-(15,22)
(15,41)-(15,42)
*)

(* type error slice
(11,3)-(15,49)
(11,21)-(15,47)
(12,2)-(15,47)
(13,13)-(13,16)
(15,14)-(15,20)
(15,14)-(15,47)
(15,21)-(15,22)
(15,23)-(15,47)
(15,24)-(15,40)
(15,25)-(15,37)
(15,41)-(15,42)
(15,43)-(15,46)
*)

(* all spans
(11,21)-(15,47)
(12,2)-(15,47)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,14)-(15,47)
(15,21)-(15,22)
(15,14)-(15,20)
(15,23)-(15,47)
(15,41)-(15,42)
(15,24)-(15,40)
(15,25)-(15,37)
(15,38)-(15,39)
(15,43)-(15,46)
*)
