
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
  | Sine s -> "pi* " + (exprToString s);;


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
  | Sine s -> "pi* " ^ (exprToString s);;

*)

(* changed spans
(15,14)-(15,20)
(15,14)-(15,39)
*)

(* type error slice
(11,3)-(15,41)
(11,21)-(15,39)
(12,2)-(15,39)
(13,13)-(13,16)
(15,14)-(15,20)
(15,14)-(15,39)
(15,23)-(15,39)
(15,24)-(15,36)
*)

(* all spans
(11,21)-(15,39)
(12,2)-(15,39)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,14)-(15,39)
(15,14)-(15,20)
(15,23)-(15,39)
(15,24)-(15,36)
(15,37)-(15,38)
*)
