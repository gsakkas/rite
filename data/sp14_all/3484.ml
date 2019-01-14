
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
(12,2)-(22,75)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine expr0 -> "sin(" ^ (exprToString expr0 ^ ")")
| Cosine expr0 -> "cos(" ^ (exprToString expr0 ^ ")")
| Average (expr0 , expr1) -> "(" ^ (exprToString expr0 ^ ("+" ^ (exprToString expr1 ^ ")/2)")))
| Times (expr0 , expr1) -> "(" ^ (exprToString expr0 ^ ("*" ^ (exprToString expr1 ^ ")")))
| Thresh (expr0 , expr1 , expr2 , expr3) -> "(" ^ (exprToString expr0 ^ ("<" ^ (exprToString expr1 ^ ("?" ^ (exprToString expr2 ^ (":" ^ (exprToString expr3 ^ ")")))))))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

(15,41)-(15,45)
expr0
VarG

(16,43)-(16,47)
expr0
VarG

(18,27)-(18,31)
expr0
VarG

(18,57)-(18,61)
expr1
VarG

(20,27)-(20,31)
expr0
VarG

(20,57)-(20,61)
expr1
VarG

(22,13)-(22,17)
exprToString expr0
AppG (fromList [VarG])

(22,20)-(22,74)
exprToString
VarG

(22,20)-(22,74)
expr0
VarG

(22,28)-(22,32)
exprToString expr1
AppG (fromList [VarG])

(22,35)-(22,72)
exprToString
VarG

(22,35)-(22,72)
expr1
VarG

(22,43)-(22,47)
exprToString expr2
AppG (fromList [VarG])

(22,50)-(22,70)
exprToString
VarG

(22,50)-(22,70)
expr2
VarG

(22,58)-(22,62)
exprToString expr3
AppG (fromList [VarG])

(22,65)-(22,68)
exprToString
VarG

(22,65)-(22,68)
expr3
VarG

*)
