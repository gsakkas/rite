CaseG (fromList [(ConsPatG WildPatG VarPatG,Nothing,AppG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])
match l with
| [] -> []
| _ :: tl -> listReverse tl
