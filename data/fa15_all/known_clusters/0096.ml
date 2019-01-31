CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])
match f b with
| (h , t) -> if t = false
             then h
             else ()
match f b with
| (h , t) -> if t = false
             then h
             else ()
match f b with
| (h , t) -> if t = true
             then h
             else ()
match f b with
| (b' , c') -> if c' = false
               then b'
               else wwhile (f , b')
match f b with
| (b' , c') -> if c' = false
               then b'
               else wwhile (f , b')
match f b with
| (b' , c') -> if c' = false
               then b'
               else wwhile (f , b')
match f b with
| (h1 , h2) -> if h2
               then wwhile (f , h1)
               else h1
match f b with
| (h1 , h2) -> if h2
               then wwhile (f , h1)
               else h1
match f b with
| (h1 , h2) -> if h2
               then wwhile (f , h1)
               else h1
match f b with
| (h1 , h2) -> if h2
               then wwhile (f , h1)
               else h1
match f b with
| (h1 , h2) -> if h2
               then wwhile (f , h1)
               else h1
match f b with
| (h1 , h2) -> if h2
               then wwhile (f , h1)
               else h1
match f b with
| (b' , c') -> if c'
               then wwhile (f , b')
               else b'
