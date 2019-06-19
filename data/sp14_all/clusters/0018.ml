CaseG VarG [(TuplePatG (fromList [EmptyPatG]),Nothing,TupleG [EmptyG,EmptyG])]
match a with
| (h1 :: t1 , _) -> (l1 , [0 ; 0 ; 0 ; 0])
match a with
| (h1 :: t1 , r) -> (t1 , bigAdd (mulByDigit h1
                                             (List.append r
                                                          [0]))
                                 r)
match a with
| (l1' , a') -> (l1' , bigAdd (mulByDigit x
                                          l1') a')
match a with
| (x , y) -> (carry2 , dig :: y)
match a with
| (w , y) -> ((w + z) / 10 , ((w + z) mod 10) :: y)
match a with
| (w , []) -> (w , [z / 10 ; z mod 10])
| (w , h :: t) -> ((w + z) / 10 , ((w + z) mod 10) :: t)
match x with
| (add1 , add2) -> (((add1 + add2) + carry) / 10 , (((add1 + add2) + carry) mod 10) :: rest)
| (_ , _) -> (carry / 10 , (carry mod 10) :: rest)
match x with
| (add1 , add2) -> (((add1 + add2) + carry) / 10 , (((add1 + add2) + carry) mod 10) :: rest)
match a with
| (_ , y) -> (0 , bigAdd y x)
match x with
| (d1 , d2) -> (d1 + d2 , (d1 + d2) :: (match a with
                                        | (a1 , a2) -> a2))
match a with
| ([] , []) -> ([] , [])
| (list1 , list2) -> (list1 , list2)
match x with
| (h1 , h2) -> ([(h1 + h2) / 10] , [(h1 + h2) mod 10])
match a with
| (h1 :: t1 , h2 :: t2) -> (v1 :: (h1 :: t1) , v2 :: (h2 :: t2))
match a with
| (list1 , list2) -> (v1 :: list1 , v2 :: list2)
match x with
| (k , v) -> ([k] , v)
match (a , x) with
| ((b , c) , (d , e)) -> (b , (d + e) :: c)
