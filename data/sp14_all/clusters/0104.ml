CaseG (fromList [(ConPatG Nothing,Nothing,LitG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG]))])
match e with
| VarX -> "x"
| VarY -> "y"
| Sine e -> exprToString e
| Cosine e -> exprToString e
match e with
| VarX -> "x"
| VarY -> "y"
| Sine e -> "sin (pi*" ^ (exprToString e ^ ")")
