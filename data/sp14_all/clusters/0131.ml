CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,ConAppG (Just EmptyG)),(ConPatG Nothing,Nothing,VarG)])
match l with
| [] -> l
| h :: t -> h :: (listReverse t)
match l with
| [] -> l'
| h :: t -> (List.hd l) :: (listReverse (List.tl l))
