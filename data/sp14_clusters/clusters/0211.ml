CaseG VarG [(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG,EmptyG]),(Nothing,AppG [EmptyG,EmptyG]),(Nothing,AppG [EmptyG,EmptyG]),(Nothing,AppG [EmptyG,EmptyG]),(Nothing,AppG [EmptyG,EmptyG])]
match e with
| VarX -> Format.sprintf "x"
| VarY -> Format.sprintf "y"
| Sine e' -> Format.sprintf "sin(pi*" ^ (exprToString e' ^ ")")
| Cosine e' -> Format.sprintf "cos(pi*" ^ (exprToString e' ^ ")")
| Average (e1 , e2) -> Format.sprintf "((" ^ (exprToString e1 ^ ("+" ^ (exprToString e2 ^ ")/2)")))
| Times (e1 , e2) -> Format.sprintf "" ^ (exprToString e1 ^ ("*" ^ exprToString e2))
| Thresh (a , b , a_less , b_less) -> Format.sprintf "(" ^ (exprToString a ^ ("<" ^ (exprToString b ^ ("?" ^ (exprToString a_less ^ (":" ^ (exprToString b_less ^ ")")))))))
match e with
| VarX -> Format.sprintf "x"
| VarY -> Format.sprintf "y"
| Sine e' -> Format.sprintf "sin(pi*" ^ (exprToString e' ^ ")")
| Cosine e' -> Format.sprintf "cos(pi*" ^ (exprToString e' ^ ")")
| Average (e1 , e2) -> Format.sprintf "((" ^ (exprToString e1 ^ ("+" ^ (exprToString e2 ^ ")/2)")))
| Times (e1 , e2) -> Format.sprintf "" ^ (exprToString e1 ^ ("*" ^ exprToString e2))
| Thresh (a , b , a_less , b_less) -> Format.sprintf "(" ^ (exprToString a ^ ("<" ^ (exprToString b ^ ("?" ^ (exprToString a_less ^ (":" ^ (exprToString b_less ^ ")")))))))
