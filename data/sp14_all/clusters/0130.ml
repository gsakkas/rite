CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,IteG EmptyG EmptyG EmptyG),(ConPatG Nothing,Nothing,VarG)])
match l with
| [] -> d
| h :: t -> if fst h = k
            then snd h
            else assoc (d , k , t)
