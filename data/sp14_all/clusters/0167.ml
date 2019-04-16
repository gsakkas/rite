CaseG VarG (fromList [(ConsPatG VarPatG (ConPatG Nothing),Nothing,ListG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])
match l with
| [] -> []
| b :: [] -> [b]
