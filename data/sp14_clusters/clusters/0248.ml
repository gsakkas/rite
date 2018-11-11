CaseG (BopG EmptyG EmptyG) [(Nothing,ConAppG (Just EmptyG) Nothing),(Nothing,ConAppG (Just EmptyG) Nothing)]
match n > 9 with
| false -> n :: (digitsOfInt (n / 10))
| true -> (n mod 10) :: (digitsOfInt (n / 10))
match n > 9 with
| false -> n :: (digitsOfInt (n / 10))
| true -> (n mod 10) :: (digitsOfInt (n / 10))
