CaseG (BopG EmptyG EmptyG) [(Nothing,ConAppG (Just EmptyG) Nothing),(Nothing,AppG [EmptyG])]
match n > 9 with
| false -> n :: (digitsOfInt n)
| true -> digitsOfInt (n mod 10)
match n > 9 with
| false -> n :: (digitsOfInt n)
| true -> digitsOfInt (n mod 10)
