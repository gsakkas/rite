CaseG (TupleG (fromList [EmptyG])) (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])
match (d , k , l) with
| (d , k , l) -> if l = []
                 then d
                 else (match l with
                       | h :: t -> match h with
                                   | (a , b) -> if a = k
                                                then b
                                                else assoc (d , k , t))
