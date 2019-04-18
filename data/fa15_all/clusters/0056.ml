CaseG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,IteG EmptyG EmptyG EmptyG)])
match f b with
| (b' , c') -> if c' = false
               then b'
               else wwhile (f , b')
match f b with
| (h1 , h2) -> if h2
               then wwhile (f , h1)
               else h1
match f b with
| (b' , c') -> if c'
               then wwhile (f , b')
               else b'
match x with
| (x , y) -> if y = false
             then x
             else wwhile (f , x)
