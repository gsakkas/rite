
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
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e2 -> "cos(pi*" ^ ((exprToString e2) ^ ")")
  | Average (e3,e4) ->
      "((" ^ ((exprToString e3) ^ (("+" exprToString e4) ^ ")/2)"));;


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
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e2 -> "cos(pi*" ^ ((exprToString e2) ^ ")")
  | Average (e3,e4) ->
      "((" ^ ((exprToString e3) ^ ("+" ^ ((exprToString e4) ^ ")/2)")));;

*)

(* changed spans
(18,35)-(18,56)
(18,40)-(18,52)
*)

(* type error slice
(18,35)-(18,56)
(18,36)-(18,39)
*)

(* all spans
(11,21)-(18,67)
(12,2)-(18,67)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,15)-(15,52)
(15,25)-(15,26)
(15,15)-(15,24)
(15,27)-(15,52)
(15,46)-(15,47)
(15,28)-(15,45)
(15,29)-(15,41)
(15,42)-(15,44)
(15,48)-(15,51)
(16,17)-(16,54)
(16,27)-(16,28)
(16,17)-(16,26)
(16,29)-(16,54)
(16,48)-(16,49)
(16,30)-(16,47)
(16,31)-(16,43)
(16,44)-(16,46)
(16,50)-(16,53)
(18,6)-(18,67)
(18,11)-(18,12)
(18,6)-(18,10)
(18,13)-(18,67)
(18,32)-(18,33)
(18,14)-(18,31)
(18,15)-(18,27)
(18,28)-(18,30)
(18,34)-(18,66)
(18,57)-(18,58)
(18,35)-(18,56)
(18,36)-(18,39)
(18,40)-(18,52)
(18,53)-(18,55)
(18,59)-(18,65)
*)
