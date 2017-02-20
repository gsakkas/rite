
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
(17,23)-(17,26)
(17,23)-(17,50)
(17,27)-(17,28)
(17,29)-(17,50)
*)

(* type error slice
(12,2)-(19,40)
(12,2)-(19,40)
(17,29)-(17,50)
(17,30)-(17,32)
(17,33)-(17,34)
(17,35)-(17,49)
(17,36)-(17,38)
(17,39)-(17,40)
*)

(* all spans
(11,21)-(19,40)
(12,2)-(19,40)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,16)-(15,21)
(16,18)-(16,23)
(17,23)-(17,50)
(17,27)-(17,28)
(17,23)-(17,26)
(17,29)-(17,50)
(17,33)-(17,34)
(17,30)-(17,32)
(17,35)-(17,49)
(17,39)-(17,40)
(17,36)-(17,38)
(17,41)-(17,48)
(18,21)-(18,32)
(19,32)-(19,40)
*)
