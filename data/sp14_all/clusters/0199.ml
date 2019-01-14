CaseG VarG (fromList [(Nothing,VarG),(Nothing,ListG EmptyG Nothing)])
match l with
| [] -> []
| h :: t -> t
match l with
| [] -> []
| h :: m :: t -> t
