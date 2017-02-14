
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
      "((" ^
        ((exprToString e) ^ ("+" ^ ((exprToString e) ^ (")" / (2 ")")))))
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
(19,24)-(19,25)
(19,51)-(19,52)
(19,57)-(19,60)
(19,57)-(19,69)
(19,64)-(19,65)
(19,64)-(19,69)
(19,66)-(19,69)
(20,20)-(20,53)
(20,33)-(20,34)
(20,35)-(20,38)
(20,39)-(20,51)
(20,52)-(20,53)
*)

(* type error slice
(15,29)-(15,41)
(15,29)-(15,43)
(15,29)-(15,50)
(15,45)-(15,46)
(19,38)-(19,69)
(19,54)-(19,55)
(19,57)-(19,60)
(19,57)-(19,69)
(19,57)-(19,69)
(19,64)-(19,65)
(19,64)-(19,69)
(20,20)-(20,32)
(20,20)-(20,53)
*)
