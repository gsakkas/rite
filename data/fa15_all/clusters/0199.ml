CaseG (BopG EmptyG EmptyG) (fromList [(VarPatG,Nothing,IteG EmptyG EmptyG EmptyG),(LitPatG,Nothing,TupleG (fromList [EmptyG]))])
match List.length l1 - List.length l2 with
| 0 -> (l1 , l2)
| n -> if n < 0
       then (clone 0
                   (n * (-1)) @ l1 , l2)
       else (clone 0 n @ l2 , l1)
