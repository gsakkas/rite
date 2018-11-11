CaseG (TupleG [EmptyG,EmptyG]) [(Nothing,ConAppG (Just EmptyG) Nothing),(Nothing,ListG EmptyG Nothing)]
match (List.rev list1 , List.rev list2) with
| (h1 :: t1 , h2 :: t2) -> (h1 , h2) :: (pair t1
                                              t2)
| (_ , _) -> []
match (List.rev list1 , List.rev list2) with
| (h1 :: t1 , h2 :: t2) -> (h1 , h2) :: (pair t1
                                              t2)
| (_ , _) -> []
