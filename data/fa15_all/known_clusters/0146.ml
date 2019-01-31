CaseG VarG (fromList [(Nothing,VarG),(Nothing,IteG EmptyG EmptyG EmptyG)])
match l with
| [] -> d
| (n , m) :: t -> if n = k
                  then m
                  else assoc (d , k , t)
match l with
| [] -> d
| (n , m) :: t -> if n = k
                  then m
                  else assoc (d , k , t)
match k with
| h2 -> h1
| _ -> if l = []
       then d
       else assoc (d , k , t)
match k with
| h2 -> h1
| _ -> if l = []
       then d
       else assoc (d , k , t)
