CaseG VarG (fromList [(ConsPatG (TuplePatG (fromList [EmptyPatG])) VarPatG,Nothing,IteG EmptyG EmptyG EmptyG),(ConPatG Nothing,Nothing,VarG)])
match l with
| (ki , vi) :: t -> if k = ki
                    then vi
                    else assoc (d , k , t)
| [] -> d
match l with
| [] -> d
| (k' , d') :: t -> if k = k'
                    then d'
                    else assoc (d , k , t)
