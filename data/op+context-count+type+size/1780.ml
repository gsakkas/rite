
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
  | VarX  -> "X"
  | VarY  -> "Y"
  | Sine sin -> "sin"
  | Cosine cos -> "cos"
  | Average (n1,n2) -> "(" ^ (n1 ^ (n2 ^ "/ 2 )"))
  | Times (t1,t2) -> "(t1 * t2)"
  | Thresh (th1,th2,th3,th4) -> "thresh";;


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
  | VarX  -> "X"
  | VarY  -> "Y"
  | Sine sin -> "sin"
  | Cosine cos -> "cos"
  | Average (n1,n2) -> "(n1 + n2 / 2 )"
  | Times (t1,t2) -> "(t1 * t2)"
  | Thresh (th1,th2,th3,th4) -> "thresh";;

*)

(* changed spans
(17,24)-(17,27)
(17,24)-(17,49)
(17,28)-(17,29)
(17,31)-(17,49)
*)

(* type error slice
(12,3)-(19,41)
(17,31)-(17,33)
(17,31)-(17,49)
(17,34)-(17,35)
(17,37)-(17,39)
(17,37)-(17,49)
(17,40)-(17,41)
(17,42)-(17,49)
*)
