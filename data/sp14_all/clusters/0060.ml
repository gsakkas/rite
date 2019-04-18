CaseG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,LetG NonRec (fromList [(TuplePatG (fromList [EmptyPatG]),EmptyG)]) EmptyG)])
match x with
| (l2digit , templ1) -> (let (l2digit2 , templ12) =
                           a in
                         let multres =
                           mulByDigit l2digit templ1 in
                         (0 , bigAdd (templ12 @ [0])
                                     multres))
