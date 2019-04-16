CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,ConAppG (Just EmptyG)),(ConPatG Nothing,Nothing,ListG (fromList []))])
match l with
| h :: t -> h :: (listReverse t)
| [] -> []
match l with
| [] -> []
| h :: t -> h :: (listReverse t)
