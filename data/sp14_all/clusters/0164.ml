CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,AppG (fromList [EmptyG])),(ConPatG Nothing,Nothing,LamG VarPatG EmptyG)])
match fs with
| h :: t -> f h h
| [] -> fun x -> x
match fs with
| [] -> fun x -> x
| h :: t -> f (fun x -> x) h
