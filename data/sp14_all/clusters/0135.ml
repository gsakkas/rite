CaseG VarG (fromList [(ConPatG Nothing,Nothing,LitG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,AppG (fromList [EmptyG]))])
match e with
| VarX -> ""
| VarY -> ""
| Sine e1 -> exprToString e1
| Cosine e1 -> exprToString e1
| Average (e1 , e2) -> exprToString e1 ^ exprToString e2
| Times (e1 , e2) -> exprToString e1 ^ exprToString e2
| Thresh (e1 , e2 , e3 , e4) -> exprToString e1 ^ (exprToString e2 ^ (exprToString e3 ^ exprToString e4))
match e with
| VarX -> "x"
| VarY -> "y"
| Sine expr0 -> "sin(" ^ (exprToString expr0 ^ ")")
| Cosine expr0 -> "cos(" ^ (exprToString expr0 ^ ")")
| Average (expr0 , expr1) -> "(" ^ (exprToString expr0 ^ ("+" ^ (exprToString expr1 ^ ")/2)")))
| Times (expr0 , expr1) -> "(" ^ (exprToString expr0 ^ ("*" ^ (exprToString expr1 ^ ")")))
| Thresh (expr0 , expr1 , expr2 , expr3) -> "(" ^ (exprToString expr0 ^ ("<" ^ (exprToString expr1 ^ ("?" ^ (exprToString expr2 ^ (":" ^ (exprToString expr3 ^ ")")))))))
