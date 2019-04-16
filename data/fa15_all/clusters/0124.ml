CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,IteG EmptyG EmptyG EmptyG),(ConPatG Nothing,Nothing,LitG)])
match x with
| [] -> true
| h :: t -> if getHead x = getHead (listReverse x)
            then matchHeads (getTail (listReverse t))
            else false
