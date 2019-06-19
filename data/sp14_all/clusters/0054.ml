CaseG VarG [(TuplePatG (fromList [EmptyPatG]),Nothing,VarG)]
match x with
| (_ , _) -> a
match a with
| (x , y) -> x
match a with
| (f , g) -> f
match a with
| (a1 , a2) -> a2
