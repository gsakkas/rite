
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
      "((" ^ ((exprToString e) ^ ("+" ^ ((exprToString e) ^ ")/2)")))
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
(18,28)-(18,29)
y
VarG

(18,55)-(18,56)
y
VarG

(19,19)-(19,31)
(^)
VarG

(19,19)-(19,31)
exprToString x
AppG (fromList [VarG])

(19,19)-(19,52)
exprToString x ^ ("*" ^ exprToString y)
AppG (fromList [AppG (fromList [EmptyG])])

(19,32)-(19,33)
x
VarG

(19,34)-(19,37)
(^)
VarG

(19,34)-(19,37)
"*" ^ exprToString y
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(19,38)-(19,50)
exprToString y
AppG (fromList [VarG])

(19,51)-(19,52)
y
VarG

*)
