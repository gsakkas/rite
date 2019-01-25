CaseG VarG (fromList [(Nothing,ListG EmptyG Nothing)])
match l with
| [] -> []
| h :: t -> [h]
match n with
| 0 -> []
