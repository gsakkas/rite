
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Volume of expr* expr* expr
  | Tan of expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | Volume (e1,e2,e3) ->
      "(" ^
        ((exprToString e1 "*") ^
           ((exprToString e2 "*") ^ ((exprToString e3) ^ ")")))
  | Tan e1 -> "tan(pi*" ^ ((exprToString e1) ^ ")");;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Volume of expr* expr* expr
  | Tan of expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | Volume (e1,e2,e3) ->
      "(" ^
        ((exprToString e1) ^
           ("*" ^ ((exprToString e2) ^ ("*" ^ ((exprToString e3) ^ ")")))))
  | Tan e1 -> "tan(pi*" ^ ((exprToString e1) ^ ")");;

*)

(* changed spans
(31,10)-(31,31)
exprToString e1
AppG [VarG]

(32,13)-(32,34)
"*"
LitG

(32,52)-(32,54)
e2
VarG

(32,58)-(32,61)
"*" ^ (exprToString e3 ^ ")")
AppG [LitG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(17,28)-(17,53)
(17,29)-(17,46)
(17,30)-(17,42)
(17,47)-(17,48)
(31,10)-(31,31)
(31,11)-(31,23)
(32,13)-(32,34)
(32,14)-(32,26)
*)
