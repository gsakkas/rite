CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,TupleG (fromList [EmptyG]))])
match a with
| (len , []) -> (len , [sum])
| (len , x' :: xs') -> if x' = (-1)
                       then if sum = 9
                            then (len , (-1) :: (0 :: xs'))
                            else (len , (sum + 1) :: xs')
                       else (len , sum :: (x' :: xs'))
match a with
| (len , []) -> (len , [(-1) ; sum mod 10])
| (len , x' :: xs') -> if x' = (-1)
                       then (len , (-1) :: (((sum mod 10) + 1) :: xs'))
                       else (len , (-1) :: ((sum mod 10) :: (x' :: xs')))
match a with
| (len , []) -> (len , [sum])
| (len , x' :: xs') -> if x' = (-1)
                       then if sum = 9
                            then (len , (-1) :: (0 :: xs'))
                            else (len , (sum + 1) :: xs')
                       else (len , sum :: (x' :: xs'))
match a with
| (len , []) -> (len , [(-1) ; sum mod 10])
| (len , x' :: xs') -> if x' = (-1)
                       then (len , (-1) :: (((sum mod 10) + 1) :: xs'))
                       else (len , (-1) :: ((sum mod 10) :: (x' :: xs')))
match a with
| (len , []) -> (len , [sum])
| (len , x' :: xs') -> if x' = (-1)
                       then if sum = 9
                            then (len , (-1) :: (0 :: xs'))
                            else (len , (sum + 1) :: xs')
                       else (len , sum :: (x' :: xs'))
match a with
| (len , []) -> (len , [(-1) ; sum mod 10])
| (len , x' :: xs') -> if x' = (-1)
                       then (len , (-1) :: (((sum mod 10) + 1) :: xs'))
                       else (len , (-1) :: ((sum mod 10) :: (x' :: xs')))
