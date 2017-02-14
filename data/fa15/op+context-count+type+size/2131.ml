
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
  | Sine e -> "sin(pi*" exprToString e ")"
  | Cosine e -> "cos(pi*" exprToString e ")"
  | Average (x,y) ->
      ("((" exprToString e) ^ ("+" ^ ((exprToString e ")") / (2 ")")))
  | Times e -> exprToString e "*" exprToString e;;


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
(12,2)-(19,48)
(15,14)-(15,23)
(15,14)-(15,42)
(15,24)-(15,36)
(16,16)-(16,25)
(16,16)-(16,44)
(16,26)-(16,38)
(18,6)-(18,27)
(18,12)-(18,24)
(18,25)-(18,26)
(18,37)-(18,69)
(18,39)-(18,51)
(18,52)-(18,53)
(18,54)-(18,57)
(18,62)-(18,63)
(18,64)-(18,67)
(19,15)-(19,48)
(19,28)-(19,29)
(19,30)-(19,33)
(19,34)-(19,46)
(19,47)-(19,48)
*)

(* type error slice
(15,14)-(15,23)
(15,14)-(15,42)
(16,16)-(16,25)
(16,16)-(16,44)
(18,6)-(18,27)
(18,7)-(18,11)
(18,30)-(18,70)
(18,35)-(18,36)
(18,37)-(18,69)
(18,37)-(18,69)
(18,38)-(18,58)
(18,39)-(18,51)
(18,61)-(18,68)
(18,62)-(18,63)
(19,15)-(19,27)
(19,15)-(19,48)
*)
