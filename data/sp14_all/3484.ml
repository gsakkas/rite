
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
  | Sine expr -> "sin(" ^ ((exprToString expr) ^ ")")
  | Cosine expr -> "cos(" ^ ((exprToString expr) ^ ")")
  | Average (expr,expr) ->
      "(" ^ ((exprToString expr) ^ ("+" ^ ((exprToString expr) ^ ")/2)")))
  | Times (expr,expr) ->
      "(" ^ ((exprToString expr) ^ ("*" ^ ((exprToString expr) ^ ")")))
  | Thresh (expr,expr,expr,expr) ->
      "(" ^ (expr ^ ("<" ^ (expr ^ ("?" ^ (expr ^ (":" ^ (expr ^ ")")))))));;


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
(12,3)-(22,76)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine expr0 -> "sin(" ^ (exprToString expr0 ^ ")")
| Cosine expr0 -> "cos(" ^ (exprToString expr0 ^ ")")
| Average (expr0 , expr1) -> "(" ^ (exprToString expr0 ^ ("+" ^ (exprToString expr1 ^ ")/2)")))
| Times (expr0 , expr1) -> "(" ^ (exprToString expr0 ^ ("*" ^ (exprToString expr1 ^ ")")))
| Thresh (expr0 , expr1 , expr2 , expr3) -> "(" ^ (exprToString expr0 ^ ("<" ^ (exprToString expr1 ^ ("?" ^ (exprToString expr2 ^ (":" ^ (exprToString expr3 ^ ")")))))))
CaseG VarG (fromList [(ConPatG Nothing,Nothing,LitG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(12,3)-(22,76)
(22,13)-(22,76)
(22,14)-(22,18)
(22,19)-(22,20)
(22,28)-(22,74)
(22,29)-(22,33)
(22,34)-(22,35)
(22,43)-(22,72)
(22,44)-(22,48)
(22,49)-(22,50)
(22,58)-(22,70)
(22,59)-(22,63)
(22,64)-(22,65)
*)
