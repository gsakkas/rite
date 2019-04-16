CaseG VarG (fromList [(ConsPatG (ConsPatG EmptyPatG EmptyPatG) (ConPatG Nothing),Nothing,VarG),(ConPatG Nothing,Nothing,VarG)])
match l with
| [] -> l
| (_ :: tail :: []) :: [] -> l
