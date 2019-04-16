CaseG VarG (fromList [(ConPatG Nothing,Nothing,LitG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,AppG (fromList [EmptyG]))])
match e with
| VarX -> "x"
| VarY -> "y"
| Sine e1 -> exprToString e1
| Cosine e1 -> exprToString e1
| Average (e1 , e2) -> (exprToString e1 ^ ("+" ^ exprToString e2)) ^ "/2"
| Times (e1 , e2) -> exprToString e1 ^ ("*" ^ exprToString e2)
| Thresh (e1 , e2 , e3 , e4) -> exprToString e1 ^ ("+" ^ exprToString e2)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine e1 -> "sin(pi*" ^ (exprToString e1 ^ ")")
| Cosine e1 -> "cos(pi*" ^ (exprToString e1 ^ ")")
| Average (e1 , e2) -> "((" ^ (exprToString e1 ^ ("+" ^ (exprToString e2 ^ ")/2)")))
| Times (e1 , e2) -> exprToString e1 ^ ("*" ^ exprToString e2)
| Thresh (e1 , e2 , e3 , e4) -> "(" ^ (exprToString e1 ^ ("<" ^ (exprToString e2 ^ ("?" ^ (exprToString e3 ^ (":" ^ (exprToString e4 ^ ")")))))))
match e with
| VarX -> "x"
| VarY -> "y"
| Sine a -> "sin(pi*" ^ (exp a ^ ")")
| Cosine a -> "cos(pi*" ^ (exp a ^ ")")
| Average (a , b) -> "((" ^ (exp a ^ ("+" ^ (exp b ^ ")/2)")))
| Times (a , b) -> exp a ^ ("*" ^ exp b)
| Thresh (a , b , c , d) -> "(" ^ (exp a ^ ("<" ^ (exp b ^ ("?" ^ (exp c ^ (":" ^ (exp d ^ ")")))))))
| Hoi (a , b , c) -> "sin(pi*" ^ (exp a ^ (")*cos(pi*" ^ (exp b ^ (")/(" ^ (exp c ^ ")")))))
match expr with
| VarX -> "x"
| VarY -> "y"
| Sine ex -> "sin(pi*" ^ (exprToString ex ^ ")")
| Cosine ex -> "cos(pi*" ^ (exprToString ex ^ ")")
| Average (ex1 , ex2) -> "(" ^ (exprToString ex1 ^ ("*" ^ (exprToString ex2 ^ ")/2")))
| Times (ex1 , ex2) -> exprToString ex1 ^ ("*" ^ exprToString ex2)
| Thresh (ex1 , ex2 , ex3 , ex4) -> "(" ^ (exprToString ex1 ^ ("<" ^ (exprToString ex2 ^ ("?" ^ (exprToString ex3 ^ (":" ^ (exprToString ex4 ^ ")")))))))
match e with
| VarX -> "x"
| VarY -> "y"
| Sine e1 -> "sin (pi * " ^ (exprToString e1 ^ ")")
| Cosine e1 -> "cos (pi * " ^ (exprToString e1 ^ ")")
| Average (e1 , e2) -> "((" ^ (exprToString e1 ^ (") + " ^ (exprToString e2 ^ "/2)")))
| Times (e1 , e2) -> exprToString e1 ^ (" * " ^ exprToString e2)
| Thresh (e1 , e2 , e3 , e4) -> "(" ^ (exprToString e1 ^ ("<" ^ (exprToString e2 ^ (" ? " ^ (exprToString e3 ^ (" : " ^ (exprToString e4 ^ ")")))))))
match e with
| VarX -> "x"
| VarY -> "y"
| Sine i -> "sin" ^ ("(pi*" ^ (exprToString i ^ ")"))
| Cosine i -> "cos" ^ ("(pi*" ^ (exprToString i ^ ")"))
| Average (i1 , i2) -> "((" ^ (exprToString i1 ^ (" + " ^ (exprToString i2 ^ ")/2)")))
| Times (i1 , i2) -> exprToString i1 ^ (" * " ^ exprToString i2)
| Thresh (i1 , i2 , i3 , i4) -> "(" ^ (exprToString i1 ^ ("<" ^ (exprToString i2 ^ (" ? " ^ (exprToString i3 ^ (" : " ^ (exprToString i3 ^ ")")))))))
