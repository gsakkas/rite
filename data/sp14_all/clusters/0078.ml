CaseG VarG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,VarG)])
match a with
| (x , y) -> x
match a with
| (f , g) -> f
match a with
| (a1 , a2) -> a2
