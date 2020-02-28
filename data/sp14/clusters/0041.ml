CaseG VarG [(WildPatG,Nothing,TupleG [EmptyG,EmptyG]),(TuplePatG (fromList [EmptyPatG]),Nothing,TupleG [EmptyG,EmptyG])]
match (c , s) with
| (c , []) -> (c , c :: s)
| _ -> (((c + x') + x'') / 10 , (((c + x') + x'') mod 10) :: s)
match a with
| (_ , z) -> (0 , bigAdd z x)
| _ -> (0 , [])
