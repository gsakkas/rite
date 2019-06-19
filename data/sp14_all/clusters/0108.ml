CaseG (BopG EmptyG EmptyG) [(LitPatG,Nothing,AppG [EmptyG,EmptyG]),(LitPatG,Nothing,AppG [EmptyG])]
match n > 9 with
| false -> n :: (digitsOfInt n)
| true -> digitsOfInt (n mod 10)
