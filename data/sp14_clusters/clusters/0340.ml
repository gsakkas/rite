CaseG VarG [(Nothing,LitG),(Nothing,BopG EmptyG EmptyG),(Nothing,LitG)]
match xs with
| [] -> 0
| h :: t -> h + sumList t
| _ -> (-1)
