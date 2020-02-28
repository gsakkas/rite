CaseG VarG [(TuplePatG (fromList [EmptyPatG]),Nothing,CaseG EmptyG [(EmptyPatG,Nothing,EmptyG)])]
match x with
| (x1 , x2) -> match a with
               | (o , z) -> if ((o + x1) + x2) > 9
                            then (1 , (((o + x1) + x2) mod 10) :: z)
                            else (0 , ((o + x1) + x2) :: z)
match a with
| (carry , rest) -> match x with
                    | (add1 , add2) -> (((add1 + add2) + carry) / 10 , (((add1 + add2) + carry) mod 10) :: rest)
match a with
| (list1 , list2) -> match list1 with
                     | [] -> match x with
                             | (h1 , h2) -> ((h1 + h2) :: list1 , list2)
match x with
| (k , v) -> match a with
             | (c , d) -> (c , bigAdd d
                                      (mulByDigit k v))
