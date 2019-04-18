CaseG (fromList [(VarPatG,Nothing,IteG EmptyG EmptyG EmptyG),(LitPatG,Nothing,VarG),(WildPatG,Nothing,AppG (fromList [EmptyG]))])
match n with
| _ -> listReverse ns
| 0 -> ns
| n -> if n < 0
       then []
       else (n mod 10) :: (digitsOfInt (n / 10))
