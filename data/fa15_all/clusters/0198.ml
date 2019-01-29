CaseG VarG (fromList [(Nothing,LamG EmptyG),(Nothing,AppG (fromList [EmptyG]))])
match fs with
| h :: t -> f h h
| [] -> fun x -> x
match fs with
| [] -> fun x -> x
| h :: t -> f (fun x -> x) h
