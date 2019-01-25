CaseG VarG (fromList [(Nothing,VarG),(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])
match y with
| [] -> x
| h :: t -> (let z = h :: x in
             append (z , t))
match y with
| [] -> x
| h :: t -> (let z = h :: x in
             append (z , t))
