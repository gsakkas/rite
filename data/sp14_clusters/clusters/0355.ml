CaseG VarG [(Nothing,AppG [EmptyG]),(Nothing,VarG),(Nothing,IteG EmptyG EmptyG EmptyG)]
match n with
| _ -> listReverse ns
| 0 -> ns
| n -> if n < 0
       then []
       else (n mod 10) :: (digitsOfInt (n / 10))
