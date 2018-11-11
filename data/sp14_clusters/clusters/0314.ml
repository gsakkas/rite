CaseG (TupleG [EmptyG,EmptyG]) [(Nothing,TupleG [EmptyG,EmptyG])]
match (a , x) with
| ((b , c) , (d , e)) -> (b , (d + e) :: c)
match (a , x) with
| ((b , c) , (d , e)) -> (b , (d + e) :: c)
