CaseG VarG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,CaseG EmptyG (fromList [(TuplePatG (fromList [EmptyPatG]),Nothing,EmptyG)]))])
match x with
| (x1 , x2) -> match a with
               | (o , z) -> if ((o + x1) + x2) > 9
                            then (1 , (((o + x1) + x2) mod 10) :: z)
                            else (0 , ((o + x1) + x2) :: z)
match a with
| (carry , rest) -> match x with
                    | (add1 , add2) -> (((add1 + add2) + carry) / 10 , (((add1 + add2) + carry) mod 10) :: rest)
match x with
| (d1 , d2) -> match a with
               | (carry , result) -> if ((d1 + d2) + carry) > 9
                                     then (1 , (((d1 + d2) + 1) - 10) :: result)
                                     else (0 , (d1 + d2) :: result)
match x with
| (k , v) -> match a with
             | (c , d) -> (c , bigAdd d
                                      (mulByDigit k v))
