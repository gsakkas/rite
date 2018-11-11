CaseG VarG [(Nothing,LitG),(Nothing,LitG),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG])]
match e with
| VarX -> "x"
| VarY -> "y"
| Sine e -> exprToString e
| Cosine e -> exprToString e
