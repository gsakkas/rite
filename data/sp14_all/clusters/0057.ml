IteG (BopG EmptyG EmptyG) (TupleG [EmptyG,EmptyG]) (TupleG [EmptyG,EmptyG])
if diff > 0
then (l1 , List.append (clone 0
                              diff) l2)
else (l1 , l2)
if b < a
then (l1 , List.append (clone 0
                              (a - b)) l2)
else (l1 , l2)
