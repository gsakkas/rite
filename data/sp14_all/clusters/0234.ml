CaseG VarG (fromList [(TuplePatG (fromList [VarPatG,WildPatG]),Nothing,TupleG (fromList [EmptyG]))])
match a with
| (_ , y) -> (0 , bigAdd y x)
