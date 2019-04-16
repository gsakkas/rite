LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (CaseG EmptyG (fromList [(ConsPatG EmptyPatG EmptyPatG,Nothing,EmptyG),(ConPatG Nothing,Nothing,EmptyG)]))
let r =
  bigAdd (mulByDigit x
                     (List.rev l2)) [b] in
match r with
| [] -> (0 , 0 :: c)
| h :: t -> (h , (List.hd t) :: c)
