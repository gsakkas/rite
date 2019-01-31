CaseG VarG (fromList [(Nothing,VarG),(Just (BopG EmptyG EmptyG),AppG (fromList [EmptyG]))])
match res with
| (x , y) when y = true -> wwhile (f , x)
| (x , y) -> x
