CaseG (AppG [EmptyG]) [(ConsPatG EmptyPatG EmptyPatG,Nothing,TupleG [EmptyG,EmptyG]),(ConPatG Nothing,Nothing,TupleG [EmptyG,EmptyG])]
match snd a with
| [] -> (fst x + snd x , [(fst x + snd x) / 10 ; (fst x + snd x) mod 10])
| h :: t -> (0 , [])
