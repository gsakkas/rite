CaseG (BopG EmptyG EmptyG) (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ConAppG (Just EmptyG) Nothing)])
match n > 9 with
| false -> n :: (digitsOfInt n)
| true -> digitsOfInt (n mod 10)
match n > 9 with
| false -> n :: (digitsOfInt n)
| true -> digitsOfInt (n mod 10)
