IteG (BopG EmptyG EmptyG) VarG (CaseG (fromList [(ConsPatG EmptyPatG EmptyPatG,Nothing,EmptyG)]))
if l = []
then d
else (match l with
      | h :: t -> match h with
                  | (a , b) -> if a = k
                               then b
                               else assoc (d , k , t))
