CaseG VarG (fromList [(LitPatG,Nothing,VarG),(WildPatG,Nothing,AppG (fromList [EmptyG]))])
match a with
| "" -> x
| _ -> a ^ (sep ^ x)
