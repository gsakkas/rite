CaseG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,IteG EmptyG EmptyG EmptyG)])
match res with
| (b' , c') -> if c'
               then acc b'
               else b'
match f b with
| (f' , x') -> if x'
               then wwhile (f , f')
               else f'
match (d , k , l) with
| (d , k , l) -> if l = []
                 then d
                 else (match l with
                       | h :: t -> match h with
                                   | (a , b) -> if a = k
                                                then b
                                                else assoc (d , k , t))
