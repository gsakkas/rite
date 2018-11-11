CaseG VarG [(Nothing,LitG),(Nothing,LitG),(Nothing,AppG [EmptyG,EmptyG]),(Nothing,AppG [EmptyG,EmptyG]),(Nothing,AppG [EmptyG,EmptyG]),(Nothing,AppG [EmptyG,EmptyG]),(Nothing,AppG [EmptyG,EmptyG]),(Nothing,LitG),(Nothing,AppG [EmptyG,EmptyG]),(Nothing,AppG [EmptyG,EmptyG])]
match e with
| VarX -> "x"
| VarY -> "y"
| Sine a -> "sin(pi*" ^ (exprToString a ^ ")")
| Cosine a -> "cos(pi*" ^ (exprToString a ^ ")")
| Average (a , b) -> "((" ^ (exprToString a ^ ("+" ^ (exprToString b ^ ")/2)")))
| Times (a , b) -> exprToString a ^ ("*" ^ exprToString b)
| Thresh (a , b , c , d) -> "(" ^ (exprToString a ^ ("<" ^ (exprToString b ^ ("?" ^ (exprToString c ^ (":" ^ (exprToString d ^ ")")))))))
| _ -> "_"
| Tan a -> "tan(pi*" ^ (exprToString a ^ ")")
| Sin_Avg (a , b , c) -> "sin(pi*(" ^ (exprToString a ^ ("+" ^ (exprToString b ^ (exprToString c ^ ")/3)"))))
match e with
| VarX -> "x"
| VarY -> "y"
| Sine a -> "sin(pi*" ^ (exprToString a ^ ")")
| Cosine a -> "cos(pi*" ^ (exprToString a ^ ")")
| Average (a , b) -> "((" ^ (exprToString a ^ ("+" ^ (exprToString b ^ ")/2)")))
| Times (a , b) -> exprToString a ^ ("*" ^ exprToString b)
| Thresh (a , b , c , d) -> "(" ^ (exprToString a ^ ("<" ^ (exprToString b ^ ("?" ^ (exprToString c ^ (":" ^ (exprToString d ^ ")")))))))
| _ -> "_"
| Tan a -> "tan(pi*" ^ (exprToString a ^ ")")
| Sin_Avg (a , b , c) -> "sin(pi*(" ^ (exprToString a ^ ("+" ^ (exprToString b ^ (exprToString c ^ ")/3)"))))
