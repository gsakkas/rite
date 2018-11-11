CaseG VarG [(Nothing,LitG),(Nothing,LitG),(Nothing,AppG [EmptyG,EmptyG])]
match e with
| VarX -> "x"
| VarY -> "y"
| Sine e -> "sin (pi*" ^ (exprToString e ^ ")")
