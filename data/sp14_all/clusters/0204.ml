LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),VarG)]) (CaseG EmptyG (fromList [(TuplePatG (fromList [EmptyPatG]),Nothing,EmptyG)]))
let (b1 , b2) = a in
match x with
| (fir , sec) -> if (fir + sec) < 10
                 then ([] , (fir + sec) :: b2)
                 else ([] , (fir + sec) :: b2)
