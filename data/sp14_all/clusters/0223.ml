CaseG VarG (fromList [(ConsPatG VarPatG (ConsPatG EmptyPatG EmptyPatG),Nothing,VarG),(ConPatG Nothing,Nothing,ListG (fromList []))])
match l with
| [] -> []
| h :: m :: t -> t
