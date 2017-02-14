
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
  | Sine expr -> "sin(pi*" ^ ((exprToString expr) ^ ")")
  | Cosine expr -> "cos(pi" ^ ((exprToString expr) ^ ")")
  | Average (expr,expr2) ->
      "((" ^ ((exprToString expr) ^ ("+" ^ ((exprToString expr2) ^ "/2)")))
  | Times (expr,expr2) -> (exprToString expr) ^ ("*" exprToString expr2)
  | Thresh (expr,expr2,expr3,expr4) ->
      "(" ^
        ((exprToString expr) ^
           ("<" ^
              ((exprToString expr2) ^
                 ("?" ^
                    ((exprToString expr3) ^ (":" ^ (exprToString expr4 ")")))))));;


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
  | Sine expr -> "sin(pi*" ^ ((exprToString expr) ^ ")")
  | Cosine expr -> "cos(pi" ^ ((exprToString expr) ^ ")")
  | Average (expr,expr2) ->
      "((" ^ ((exprToString expr) ^ ("+" ^ ((exprToString expr2) ^ "/2)")))
  | Times (expr,expr2) -> (exprToString expr) ^ ("*" ^ (exprToString expr2))
  | Thresh (expr,expr2,expr3,expr4) ->
      "(" ^
        ((exprToString expr) ^
           ("<" ^
              ((exprToString expr2) ^
                 ("?" ^
                    ((exprToString expr3) ^
                       (":" ^ ((exprToString expr4) ^ ")")))))));;

*)

(* changed spans
(19,49)-(19,52)
(19,53)-(19,65)
(26,52)-(26,64)
(26,65)-(26,70)
(26,71)-(26,74)
*)

(* type error slice
(15,29)-(15,56)
(15,30)-(15,49)
(15,31)-(15,43)
(15,50)-(15,51)
(19,48)-(19,72)
(19,49)-(19,52)
(26,51)-(26,75)
(26,52)-(26,64)
*)
