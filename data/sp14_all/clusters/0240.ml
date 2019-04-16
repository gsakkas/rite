CaseG (AppG (fromList [EmptyG])) (fromList [(TuplePatG (fromList [VarPatG]),Nothing,IteG EmptyG EmptyG EmptyG)])
match f b with
| (f' , x') -> if x'
               then wwhile (f , f')
               else f'
