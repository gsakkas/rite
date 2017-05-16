
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
  | Sine s -> "sin(pi*" ^ (exprToString s ")");;


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
  | Sine s -> "sin(pi*" ^ ((exprToString s) ^ ")");;

*)

(* changed spans
(15,27)-(15,39)
*)

(* type error slice
(11,3)-(15,48)
(11,21)-(15,46)
(12,2)-(15,46)
(13,13)-(13,16)
(15,26)-(15,46)
(15,27)-(15,39)
*)

(* all spans
(11,21)-(15,46)
(12,2)-(15,46)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,14)-(15,46)
(15,24)-(15,25)
(15,14)-(15,23)
(15,26)-(15,46)
(15,27)-(15,39)
(15,40)-(15,41)
(15,42)-(15,45)
*)
