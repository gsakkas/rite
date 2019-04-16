CaseG (AppG (fromList [EmptyG])) (fromList [(ConsPatG VarPatG VarPatG,Nothing,TupleG (fromList [EmptyG])),(ConPatG Nothing,Nothing,TupleG (fromList [EmptyG]))])
match snd a with
| [] -> (fst x + snd x , [(fst x + snd x) / 10 ; (fst x + snd x) mod 10])
| h :: t -> (0 , [])
