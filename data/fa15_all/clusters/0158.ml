LetG NonRec (fromList [(VarPatG,LamG (TuplePatG (fromList [EmptyPatG])) EmptyG)]) (AppG (fromList [EmptyG]))
let combine =
  fun (a , b) -> a + b in
List.map combine
         (List.rev (List.combine l1
                                 l2))
