
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
  | Sine s -> (String.concat "pi* ") ^ (exprToString s);;


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
(15,14)-(15,36)
(15,15)-(15,28)
*)

(* type error slice
(15,14)-(15,36)
(15,14)-(15,55)
(15,15)-(15,28)
(15,37)-(15,38)
*)

(* all spans
(11,21)-(15,55)
(12,2)-(15,55)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,14)-(15,55)
(15,37)-(15,38)
(15,14)-(15,36)
(15,15)-(15,28)
(15,29)-(15,35)
(15,39)-(15,55)
(15,40)-(15,52)
(15,53)-(15,54)
*)
