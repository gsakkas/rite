CaseG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,TupleG (fromList [EmptyG])),(TuplePatG (fromList [ConPatG Nothing]),Nothing,TupleG (fromList [EmptyG]))])
match a with
| ([] , []) -> ([] , [])
| (list1 , list2) -> (list1 , list2)
