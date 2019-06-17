CaseG VarG [(ConsPatG EmptyPatG EmptyPatG,Nothing,AppG [EmptyG,EmptyG]),(ConPatG Nothing,Nothing,LamG EmptyPatG EmptyG)]
match fs with
| h :: t -> f h h
| [] -> fun x -> x
match fs with
| [] -> fun x -> x
| h :: t -> f (fun x -> x) h
