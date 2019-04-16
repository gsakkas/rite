CaseG (BopG EmptyG EmptyG) (fromList [(LitPatG,Nothing,CaseG EmptyG (fromList [(LitPatG,Nothing,EmptyG)])),(LitPatG,Nothing,ListG (fromList []))])
match n > 0 with
| false -> []
| true -> match n > 9 with
          | false -> n :: (digitsOfInt n)
          | true -> digitsOfInt (n mod 10)
