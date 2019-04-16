CaseG VarG (fromList [(TuplePatG (fromList [VarPatG,WildPatG]),Nothing,TupleG (fromList [EmptyG])),(WildPatG,Nothing,TupleG (fromList [EmptyG]))])
match a with
| (_ , z) -> (0 , bigAdd z x)
| _ -> (0 , [])
