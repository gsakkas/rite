CaseG (fromList [(ConsPatG VarPatG VarPatG,Nothing,IteG EmptyG EmptyG EmptyG),(ConPatG Nothing,Nothing,ListG (fromList []))])
match l with
| [] -> []
| h :: t -> if h = 0
            then removeZero t
            else l
match y with
| [] -> []
| hd :: tl -> if tl = []
              then [(hd , x)]
              else (hd , x) :: (argmaker x
                                         tl)
