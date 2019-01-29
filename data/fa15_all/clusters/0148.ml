CaseG (BopG EmptyG EmptyG) (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)])),(Nothing,ListG EmptyG Nothing)])
match n > 0 with
| false -> []
| true -> match n > 9 with
          | false -> n :: (digitsOfInt n)
          | true -> digitsOfInt (n mod 10)
match n > 0 with
| false -> []
| true -> match n > 9 with
          | false -> n :: (digitsOfInt n)
          | true -> digitsOfInt (n mod 10)
match n > 0 with
| false -> []
| true -> match n > 9 with
          | false -> n :: (digitsOfInt (n / 10))
          | true -> (n mod 10) :: (digitsOfInt (n / 10))
match n > 0 with
| false -> []
| true -> match n > 9 with
          | false -> n :: (digitsOfInt (n / 10))
          | true -> (n mod 10) :: (digitsOfInt (n / 10))
