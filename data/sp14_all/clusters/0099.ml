CaseG (BopG EmptyG EmptyG) [(LitPatG,Nothing,ListG []),(LitPatG,Nothing,CaseG EmptyG [(EmptyPatG,Nothing,EmptyG),(EmptyPatG,Nothing,EmptyG)])]
match n > 0 with
| false -> []
| true -> match n > 9 with
          | false -> n :: (digitsOfInt n)
          | true -> digitsOfInt (n mod 10)
