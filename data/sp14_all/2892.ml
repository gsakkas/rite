
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
(15,15)-(15,40)
"pi* " ^ exprToString s
AppG [LitG,AppG [EmptyG]]

*)

(* type error slice
(11,4)-(15,42)
(11,22)-(15,40)
(12,3)-(15,40)
(13,14)-(13,17)
(15,15)-(15,21)
(15,15)-(15,40)
(15,24)-(15,40)
(15,25)-(15,37)
*)
