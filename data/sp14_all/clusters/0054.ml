CaseG (fromList [(LitPatG,Nothing,VarG),(LitPatG,Nothing,AppG (fromList [EmptyG]))])
match c' with
| true -> wwhile (f , b')
| false -> b'
