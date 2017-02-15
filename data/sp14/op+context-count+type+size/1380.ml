
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
  | Sine expr0 -> "sin(" ^ ((exprToString expr0) ^ ")")
  | Cosine expr0 -> "cos(" ^ ((exprToString expr0) ^ ")")
  | Average (expr0,expr1) ->
      "(" ^ ((exprToString expr0) ^ ("+" ^ ((exprToString expr1) ^ ")/2)")))
  | Times (expr0,expr1) ->
      "(" ^ ((exprToString expr0) ^ ("*" ^ ((exprToString expr1) ^ ")")))
  | Thresh (expr0,expr1,expr2,expr3) ->
      "(" ^
        (expr0 ^ ("<" ^ (expr1 ^ ("?" ^ (expr2 ^ (":" ^ (expr3 ^ ")")))))));;


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
  | Sine expr0 -> "sin(" ^ ((exprToString expr0) ^ ")")
  | Cosine expr0 -> "cos(" ^ ((exprToString expr0) ^ ")")
  | Average (expr0,expr1) ->
      "(" ^ ((exprToString expr0) ^ ("+" ^ ((exprToString expr1) ^ ")/2)")))
  | Times (expr0,expr1) ->
      "(" ^ ((exprToString expr0) ^ ("*" ^ ((exprToString expr1) ^ ")")))
  | Thresh (expr0,expr1,expr2,expr3) ->
      "(" ^
        ((exprToString expr0) ^
           ("<" ^
              ((exprToString expr1) ^
                 ("?" ^
                    ((exprToString expr2) ^
                       (":" ^ ((exprToString expr3) ^ ")")))))));;

*)

(* changed spans
(23,9)-(23,14)
(23,25)-(23,30)
(23,41)-(23,46)
(23,57)-(23,62)
(23,63)-(23,64)
(23,65)-(23,68)
*)

(* type error slice
(12,2)-(23,75)
(12,2)-(23,75)
(12,2)-(23,75)
(12,2)-(23,75)
(23,8)-(23,75)
(23,9)-(23,14)
(23,15)-(23,16)
(23,24)-(23,73)
(23,25)-(23,30)
(23,31)-(23,32)
(23,40)-(23,71)
(23,41)-(23,46)
(23,47)-(23,48)
(23,56)-(23,69)
(23,57)-(23,62)
(23,63)-(23,64)
*)
