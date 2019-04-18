CaseG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,TupleG (fromList [EmptyG]))])
match a with
| (l1' , a') -> (l1' , bigAdd (mulByDigit x
                                          l1') a')
match a with
| (x , y) -> (carry2 , dig :: y)
match a with
| (w , y) -> ((w + z) / 10 , ((w + z) mod 10) :: y)
match x with
| (add1 , add2) -> (((add1 + add2) + carry) / 10 , (((add1 + add2) + carry) mod 10) :: rest)
match x with
| (d1 , d2) -> (d1 + d2 , (d1 + d2) :: (match a with
                                        | (a1 , a2) -> a2))
match x with
| (h1 , h2) -> ([(h1 + h2) / 10] , [(h1 + h2) mod 10])
match a with
| (list1 , list2) -> (v1 :: list1 , v2 :: list2)
match x with
| (k , v) -> ([k] , v)
