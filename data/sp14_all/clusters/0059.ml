CaseG VarG [(LitPatG,Nothing,VarG),(LitPatG,Nothing,AppG [EmptyG])]
match c' with
| true -> wwhile (f , b')
| false -> b'
