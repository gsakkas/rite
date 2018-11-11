CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,VarG)]
match l with
| [] -> []
| h :: t -> t
match l with
| [] -> []
| h :: m :: t -> t
