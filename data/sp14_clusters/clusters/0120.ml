CaseG VarG [(Nothing,LamG EmptyG),(Nothing,AppG [EmptyG,EmptyG])]
match fs with
| [] -> fun x -> x
| h :: t -> f (fun x -> x) h
