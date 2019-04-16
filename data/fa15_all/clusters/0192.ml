CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,IteG EmptyG EmptyG EmptyG),(WildPatG,Nothing,ListG (fromList []))])
match l with
| h :: t -> if h = 0
            then removeZero t
            else l
| _ -> []
