CaseG (fromList [(ConsPatG VarPatG VarPatG,Nothing,LitG)])
match explode x with
| h :: t -> false
