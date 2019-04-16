CaseG VarG (fromList [(ConsPatG WildPatG (ConsPatG EmptyPatG EmptyPatG),Nothing,ConAppG (Just EmptyG)),(ConPatG Nothing,Nothing,ListG (fromList []))])
match l with
| [] -> []
| _ :: h :: [] -> h :: (listReverse [])
