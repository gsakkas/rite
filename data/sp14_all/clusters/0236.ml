CaseG VarG (fromList [(TuplePatG (fromList [ConsPatG EmptyPatG EmptyPatG]),Nothing,TupleG (fromList [EmptyG]))])
match a with
| (h1 :: t1 , h2 :: t2) -> (v1 :: (h1 :: t1) , v2 :: (h2 :: t2))
