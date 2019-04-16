CaseG VarG (fromList [(VarPatG,Nothing,AppG (fromList [EmptyG])),(LitPatG,Nothing,ListG (fromList []))])
match n with
| 0 -> []
| n -> [x] @ clone x (n - 1)
