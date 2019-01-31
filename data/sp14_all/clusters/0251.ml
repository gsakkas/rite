CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,ConAppG Nothing Nothing)])
match rand (1 , 2) with
| 1 -> VarX
| 2 -> VarY
