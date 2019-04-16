CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,ConAppG (Just EmptyG))])
match a with
| hd :: tl -> (((fst x + snd x) + hd) / 10) :: ((((fst x + snd x) + hd) mod 10) :: tl)
