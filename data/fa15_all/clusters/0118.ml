IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))
if f b = b
then (b , true)
else (f b , false)
if List.length l1 > List.length l2
then (l1 , clone 0
                 (List.length l1 - List.length l2) @ l2)
else (l1 , l2)
