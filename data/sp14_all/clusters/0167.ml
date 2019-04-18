CaseG (fromList [(TuplePatG (fromList [ConsPatG EmptyPatG EmptyPatG,WildPatG]),Nothing,TupleG (fromList [EmptyG]))])
match a with
| (h1 :: t1 , _) -> (l1 , [0 ; 0 ; 0 ; 0])
