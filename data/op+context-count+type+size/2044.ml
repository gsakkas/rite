
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
(18,37)-(18,56)
(18,41)-(18,53)
*)

(* type error slice
(11,22)-(18,66)
(12,3)-(18,66)
(12,3)-(18,66)
(12,3)-(18,66)
(12,3)-(18,66)
(12,3)-(18,66)
(12,3)-(18,66)
(12,9)-(12,10)
(15,16)-(15,25)
(15,16)-(15,52)
(15,26)-(15,27)
(15,30)-(15,42)
(15,30)-(15,45)
(15,30)-(15,45)
(15,30)-(15,52)
(15,30)-(15,52)
(15,43)-(15,45)
(15,47)-(15,48)
(15,49)-(15,52)
(16,18)-(16,27)
(16,18)-(16,54)
(16,28)-(16,29)
(16,32)-(16,44)
(16,32)-(16,47)
(16,32)-(16,54)
(16,45)-(16,47)
(16,49)-(16,50)
(16,51)-(16,54)
(18,7)-(18,11)
(18,12)-(18,13)
(18,16)-(18,28)
(18,16)-(18,31)
(18,29)-(18,31)
(18,33)-(18,34)
(18,37)-(18,40)
(18,37)-(18,56)
(18,41)-(18,53)
(18,54)-(18,56)
(18,58)-(18,59)
*)
