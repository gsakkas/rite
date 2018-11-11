CaseG VarG [(Nothing,LitG),(Nothing,LitG),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG,EmptyG]),(Nothing,AppG [EmptyG,EmptyG]),(Nothing,AppG [EmptyG,EmptyG])]
match e with
| VarX -> ""
| VarY -> ""
| Sine e1 -> exprToString e1
| Cosine e1 -> exprToString e1
| Average (e1 , e2) -> exprToString e1 ^ exprToString e2
| Times (e1 , e2) -> exprToString e1 ^ exprToString e2
| Thresh (e1 , e2 , e3 , e4) -> exprToString e1 ^ (exprToString e2 ^ (exprToString e3 ^ exprToString e4))
match e with
| VarX -> ""
| VarY -> ""
| Sine e1 -> exprToString e1
| Cosine e1 -> exprToString e1
| Average (e1 , e2) -> exprToString e1 ^ exprToString e2
| Times (e1 , e2) -> exprToString e1 ^ exprToString e2
| Thresh (e1 , e2 , e3 , e4) -> exprToString e1 ^ (exprToString e2 ^ (exprToString e3 ^ exprToString e4))
