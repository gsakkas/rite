CaseG VarG [(TuplePatG (fromList [EmptyPatG]),Nothing,TupleG [EmptyG,EmptyG]),(TuplePatG (fromList [EmptyPatG]),Nothing,TupleG [EmptyG,EmptyG])]
EMPTY
match a with
| (o , []) -> (o , [x])
| (o , l) -> (o , x :: l)
