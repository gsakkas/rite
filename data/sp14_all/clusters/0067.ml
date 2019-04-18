IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))
if diff > 0
then (l1 , List.append (clone 0
                              diff) l2)
else (l1 , l2)
if b < a
then (l1 , List.append (clone 0
                              (a - b)) l2)
else (l1 , l2)
if List.length l1 < List.length l2
then (List.append (clone 0
                         (List.length l2 - List.length l1))
                  l1 , l2)
else (l1 , List.append (clone 0
                              (List.length l1 - List.length l2))
                       l2)
