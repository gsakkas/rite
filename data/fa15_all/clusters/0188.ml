CaseG (fromList [(ConsPatG VarPatG VarPatG,Nothing,IteG EmptyG EmptyG EmptyG),(ConPatG Nothing,Nothing,VarG)])
match l with
| [] -> l
| h :: t -> if h = 0
            then removeZero t
            else l
