CaseG (fromList [(TuplePatG (fromList [ConsPatG EmptyPatG EmptyPatG]),Nothing,AppG (fromList [EmptyG])),(TuplePatG (fromList [WildPatG]),Nothing,ListG (fromList []))])
match (List.rev list1 , List.rev list2) with
| (h1 :: t1 , h2 :: t2) -> (h1 , h2) :: (pair t1
                                              t2)
| (_ , _) -> []
