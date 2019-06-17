CaseG VarG [(TuplePatG (fromList [EmptyPatG]),Nothing,IteG EmptyG EmptyG EmptyG)]
match a with
| (c , h :: t) -> if ((fst x + snd x) + c) > 9
                  then (1 , (((fst x + snd x) + c) mod 10) :: t)
                  else (0 , (((fst x + snd x) + c) mod 10) :: t)
EMPTY
