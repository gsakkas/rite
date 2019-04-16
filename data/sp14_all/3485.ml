
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
(23,10)-(23,15)
exprToString expr0
AppG (fromList [VarG])

(23,26)-(23,31)
exprToString expr1
AppG (fromList [VarG])

(23,42)-(23,47)
exprToString expr2
AppG (fromList [VarG])

(23,58)-(23,63)
exprToString expr3
AppG (fromList [VarG])

*)

(* type error slice
(12,3)-(23,76)
(23,9)-(23,76)
(23,10)-(23,15)
(23,16)-(23,17)
(23,25)-(23,74)
(23,26)-(23,31)
(23,32)-(23,33)
(23,41)-(23,72)
(23,42)-(23,47)
(23,48)-(23,49)
(23,57)-(23,70)
(23,58)-(23,63)
(23,64)-(23,65)
*)
