CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,ListG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])
match l with
| [] -> []
| h :: t -> [h]
