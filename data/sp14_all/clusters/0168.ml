CaseG (fromList [(TuplePatG (fromList [TuplePatG (fromList [EmptyPatG])]),Nothing,TupleG (fromList [EmptyG]))])
match (a , x) with
| ((b , c) , (d , e)) -> (b , (d + e) :: c)
