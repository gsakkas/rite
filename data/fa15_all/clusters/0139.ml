LetG NonRec (fromList [(ConsPatG (TuplePatG (fromList [EmptyPatG])) VarPatG,VarG)]) (CaseG EmptyG (fromList [(VarPatG,Nothing,EmptyG),(WildPatG,Nothing,EmptyG)]))
let (h1 , h2) :: t = l in
match k with
| h2 -> h1
| _ -> if l = []
       then d
       else assoc (d , k , t)
