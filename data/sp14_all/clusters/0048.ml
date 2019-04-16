CaseG (TupleG (fromList [EmptyG])) (fromList [(TuplePatG (fromList [VarPatG,ConPatG Nothing]),Nothing,TupleG (fromList [EmptyG])),(WildPatG,Nothing,TupleG (fromList [EmptyG]))])
match (c , s) with
| (c , []) -> (c , c :: s)
| _ -> (((c + x') + x'') / 10 , (((c + x') + x'') mod 10) :: s)
