CaseG VarG [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)]
match a with
| (0 , acc) -> if (arg1 + arg2) > 9
               then (1 , ((arg1 + arg2) mod 10) :: acc)
               else (0 , (arg1 + arg2) :: acc)
| (0 , []) -> if (arg1 + arg2) > 9
              then (1 , [(arg1 + arg2) mod 10])
              else (0 , [arg1 + arg2])
| (_ , acc) -> if ((arg1 + arg2) + 1) > 9
               then (1 , (((arg1 + arg2) + 1) mod 10) :: acc)
               else (0 , ((arg1 + arg2) + 1) :: acc)