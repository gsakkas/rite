CaseG VarG (fromList [(VarPatG,Nothing,VarG),(ConsPatG VarPatG VarPatG,Nothing,AppG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])
match l with
| [] -> []
| h -> h
| h :: t -> t @ listReverse [h]
match l with
| [] -> []
| t -> t
| h :: t -> t @ listReverse [h]
