CaseG VarG [(Nothing,VarG),(Nothing,AppG [EmptyG,EmptyG,EmptyG])]
match x with
| [] -> l
| h :: t -> helper t l
                   (h :: acc)
match x with
| [] -> l
| h :: t -> helper t l
                   (h :: acc)
