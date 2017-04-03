
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
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString y) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> exprToString x "*" exprToString y;;


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
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString y) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y));;

*)

(* changed spans
(19,19)-(19,31)
(19,19)-(19,52)
(19,34)-(19,37)
(19,38)-(19,50)
*)

(* type error slice
(15,26)-(15,50)
(15,27)-(15,43)
(15,28)-(15,40)
(15,44)-(15,45)
(19,19)-(19,31)
(19,19)-(19,52)
*)

(* all spans
(11,21)-(19,52)
(12,2)-(19,52)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,14)-(15,50)
(15,24)-(15,25)
(15,14)-(15,23)
(15,26)-(15,50)
(15,44)-(15,45)
(15,27)-(15,43)
(15,28)-(15,40)
(15,41)-(15,42)
(15,46)-(15,49)
(16,16)-(16,52)
(16,26)-(16,27)
(16,16)-(16,25)
(16,28)-(16,52)
(16,46)-(16,47)
(16,29)-(16,45)
(16,30)-(16,42)
(16,43)-(16,44)
(16,48)-(16,51)
(18,6)-(18,69)
(18,11)-(18,12)
(18,6)-(18,10)
(18,13)-(18,69)
(18,31)-(18,32)
(18,14)-(18,30)
(18,15)-(18,27)
(18,28)-(18,29)
(18,33)-(18,68)
(18,38)-(18,39)
(18,34)-(18,37)
(18,40)-(18,67)
(18,58)-(18,59)
(18,41)-(18,57)
(18,42)-(18,54)
(18,55)-(18,56)
(18,60)-(18,66)
(19,19)-(19,52)
(19,19)-(19,31)
(19,32)-(19,33)
(19,34)-(19,37)
(19,38)-(19,50)
(19,51)-(19,52)
*)
