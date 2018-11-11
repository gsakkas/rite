CaseG VarG [(Nothing,LitG),(Nothing,LitG),(Nothing,AppG [EmptyG,EmptyG]),(Nothing,AppG [EmptyG,EmptyG]),(Nothing,AppG [EmptyG,EmptyG]),(Nothing,AppG [EmptyG,EmptyG]),(Nothing,AppG [EmptyG,EmptyG])]
match e with
| VarX -> "x"
| VarY -> "y"
| Sine expr0 -> "sin(" ^ (exprToString expr0 ^ ")")
| Cosine expr0 -> "cos(" ^ (exprToString expr0 ^ ")")
| Average (expr0 , expr1) -> "(" ^ (exprToString expr0 ^ ("+" ^ (exprToString expr1 ^ ")/2)")))
| Times (expr0 , expr1) -> "(" ^ (exprToString expr0 ^ ("*" ^ (exprToString expr1 ^ ")")))
| Thresh (expr0 , expr1 , expr2 , expr3) -> "(" ^ (exprToString expr0 ^ ("<" ^ (exprToString expr1 ^ ("?" ^ (exprToString expr2 ^ (":" ^ (exprToString expr3 ^ ")")))))))
