CaseG VarG [(ConPatG Nothing,Nothing,ListG []),(ConsPatG EmptyPatG EmptyPatG,Nothing,IteG EmptyG EmptyG EmptyG)]
match y with
| [] -> []
| hd :: tl -> if tl = []
              then [(hd , x)]
              else (hd , x) :: (argmaker x
                                         tl)
match l with
| [] -> []
| h :: t -> if h = 0
            then removeZero t
            else l
