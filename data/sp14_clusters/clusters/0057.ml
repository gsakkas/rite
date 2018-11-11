CaseG VarG [(Nothing,AppG [EmptyG,EmptyG]),(Nothing,LamG EmptyG)]
match fs with
| h :: t -> f h h
| [] -> fun x -> x
