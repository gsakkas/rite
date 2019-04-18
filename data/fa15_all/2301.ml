
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
  | Sine e -> "sin(pi*" exprToString e ")"
  | Cosine e -> "cos(pi*" exprToString e ")"
  | Average e -> (("((" exprToString e), ((exprToString e ")") / (2 ")")))
  | Times e -> exprToString e "*" exprToString e;;


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
(12,3)-(18,49)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine e -> "sin(pi*" ^ (exprToString e ^ ")")
| Cosine e -> "cos(pi*" ^ (exprToString e ^ ")")
| Average (x , y) -> "((" ^ (exprToString y ^ ("+" ^ (exprToString y ^ ")/2)")))
| Times (x , y) -> exprToString x ^ ("*" ^ exprToString y)
CaseG (fromList [(ConPatG Nothing,Nothing,LitG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,AppG (fromList [EmptyG]))])

(15,15)-(15,43)
"sin(pi*" ^ (exprToString e ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(16,17)-(16,45)
"cos(pi*" ^ (exprToString e ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(17,18)-(17,75)
"((" ^ (exprToString y ^ ("+" ^ (exprToString y ^ ")/2)")))
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(18,16)-(18,49)
exprToString x ^ ("*" ^ exprToString y)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(15,15)-(15,24)
(15,15)-(15,43)
(16,17)-(16,26)
(16,17)-(16,45)
(17,19)-(17,40)
(17,20)-(17,24)
(17,42)-(17,74)
(17,43)-(17,63)
(17,44)-(17,56)
(17,66)-(17,73)
(17,67)-(17,68)
(18,16)-(18,28)
(18,16)-(18,49)
*)
