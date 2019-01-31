CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,VarG),(Nothing,ListG EmptyG Nothing)])
match listReverse z with
| [] -> []
| h :: t -> t
