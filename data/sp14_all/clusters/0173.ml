CaseG VarG (fromList [(TuplePatG (fromList [VarPatG,ConsPatG EmptyPatG EmptyPatG]),Nothing,TupleG (fromList [EmptyG]))])
match a with
| (h1 :: t1 , r) -> (t1 , bigAdd (mulByDigit h1
                                             (List.append r
                                                          [0]))
                                 r)
