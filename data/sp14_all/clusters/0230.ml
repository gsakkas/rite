CaseG VarG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,IteG EmptyG EmptyG EmptyG)])
match res with
| (b' , c') -> if c'
               then acc b'
               else b'
