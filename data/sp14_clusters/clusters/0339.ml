CaseG VarG [(Nothing,TupleG [EmptyG,EmptyG]),(Nothing,TupleG [EmptyG,EmptyG])]
match b with
| self -> (self , false)
| _ -> (self , true)
match a with
| (_ , z) -> (0 , bigAdd z x)
| _ -> (0 , [])
match a with
| (w , []) -> (w , [z / 10 ; z mod 10])
| (w , h :: t) -> ((w + z) / 10 , ((w + z) mod 10) :: t)
