
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
  | Cosine e -> "cos(pi*" exprToString e ")"
  | Average (x,y) ->
      ("((" exprToString e) ^ ("+" ^ ((exprToString e ")") / (2 ")")))
  | Times (x,y) -> exprToString e "*" exprToString e;;


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
(16,17)-(16,26)
(16,17)-(16,45)
(16,27)-(16,39)
(18,8)-(18,27)
(18,13)-(18,25)
(18,26)-(18,27)
(18,40)-(18,52)
(18,40)-(18,68)
(18,53)-(18,54)
(18,55)-(18,58)
(18,63)-(18,64)
(18,65)-(18,68)
(19,20)-(19,53)
(19,33)-(19,34)
(19,35)-(19,38)
(19,39)-(19,51)
(19,52)-(19,53)
*)

(* type error slice
(15,29)-(15,41)
(15,29)-(15,43)
(15,29)-(15,50)
(15,45)-(15,46)
(16,17)-(16,26)
(16,17)-(16,45)
(18,8)-(18,12)
(18,8)-(18,27)
(18,32)-(18,68)
(18,36)-(18,37)
(18,40)-(18,52)
(18,40)-(18,58)
(18,40)-(18,68)
(18,63)-(18,64)
(18,63)-(18,68)
(19,20)-(19,32)
(19,20)-(19,53)
*)
