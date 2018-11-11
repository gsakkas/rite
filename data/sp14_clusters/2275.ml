
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
  | Thresh (a,b,c,d) ->
      ((exprToString a), (exprToString b), (exprToString c),
        (exprToString d));;


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
  | Sine e -> "sin (pi*" ^ ((exprToString e) ^ ")");;

*)

(* changed spans
(12,2)-(15,25)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine e -> "sin (pi*" ^ (exprToString e ^ ")")
CaseG VarG [(Nothing,LitG),(Nothing,LitG),(Nothing,AppG [EmptyG,EmptyG])]

(14,57)-(14,58)
"x"
LitG

(15,8)-(15,24)
(^)
VarG

(15,8)-(15,24)
(^)
VarG

(15,8)-(15,24)
"sin (pi*" ^ (exprToString e ^ ")")
AppG [LitG,AppG [EmptyG,EmptyG]]

(15,8)-(15,24)
exprToString e ^ ")"
AppG [AppG [EmptyG],LitG]

(15,8)-(15,24)
"y"
LitG

(15,8)-(15,24)
"sin (pi*"
LitG

(15,22)-(15,23)
e
VarG

*)
