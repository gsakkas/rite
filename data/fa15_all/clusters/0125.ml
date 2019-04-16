CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,TupleG (fromList [EmptyG])),(ConPatG Nothing,Nothing,TupleG (fromList [EmptyG]))])
match a2 with
| [] -> (0 :: a1 , (sum / 10) :: ((sum mod 10) :: a2))
| h :: t -> ((sum / 10) :: a1 , (sum mod 10) :: a2)
