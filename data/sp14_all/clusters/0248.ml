CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])
match f b with
| (x , true) -> wwhile (f , x)
| (x , false) -> x
