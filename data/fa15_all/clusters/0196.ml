CaseG VarG (fromList [(ConPatG Nothing,Nothing,LitG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,AppG (fromList [EmptyG])),(WildPatG,Nothing,LitG)])
match e with
| VarX -> "x"
| VarY -> "y"
| Sine s -> String.concat ""
                          ["sin(pi*" ; exprToString s ; ")"]
| Cosine s -> String.concat ""
                            ["cos(pi*" ; exprToString s ; ")"]
| Average (s , p) -> String.concat ""
                                   ["((" ; exprToString s ; "+" ; exprToString p ; ")/2"]
| Times (s , p) -> String.concat ""
                                 [exprToString s ; "*" ; exprToString p]
| Thresh (s , p , r , d) -> String.concat ""
                                          ["(" ; exprToString s ; "<" ; exprToString p ; "?" ; exprToString r ; ":" ; exprToString d ; ")"]
| _ -> ""
