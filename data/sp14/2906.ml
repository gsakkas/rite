
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
  | Sine s -> String.concat ["pi* "; exprToString s];;


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
(15,14)-(15,27)
(15,14)-(15,52)
(15,28)-(15,52)
(15,29)-(15,35)
*)

(* type error slice
(15,14)-(15,27)
(15,14)-(15,52)
(15,28)-(15,52)
*)

(* all spans
(11,21)-(15,52)
(12,2)-(15,52)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,14)-(15,52)
(15,14)-(15,27)
(15,28)-(15,52)
(15,29)-(15,35)
(15,37)-(15,51)
(15,37)-(15,49)
(15,50)-(15,51)
*)
