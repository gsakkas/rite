CaseG VarG (fromList [(VarPatG,Nothing,IteG EmptyG EmptyG EmptyG)])
match helper with
| f -> if f = b
       then (f , false)
       else (f , true)
