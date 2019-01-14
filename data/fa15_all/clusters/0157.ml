CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])
match l with
| [] -> []
| h -> h
| h :: t -> t @ listReverse [h]
match l with
| [] -> []
| t -> t
| h :: t -> t @ listReverse [h]
match l with
| [] -> []
| t -> t
| h :: t -> t @ listReverse [h]
