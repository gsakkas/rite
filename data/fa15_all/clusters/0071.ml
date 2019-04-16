CaseG VarG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,TupleG (fromList [EmptyG])),(TuplePatG (fromList [VarPatG,ConPatG Nothing]),Nothing,TupleG (fromList [EmptyG]))])
match a with
| (o , []) -> (o , [x])
| (o , l) -> (o , x :: l)
