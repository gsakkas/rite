LetG NonRec (fromList [(VarPatG,BopG EmptyG EmptyG)]) (CaseG EmptyG (fromList [(TuplePatG (fromList [EmptyPatG]),Nothing,EmptyG)]))
let z = fst x + snd x in
match a with
| (w , y) -> ((w + z) / 10 , ((w + z) mod 10) :: y)
