AppG [CaseG EmptyG [(Nothing,EmptyG),(Nothing,EmptyG)]]
listReverse (match n > 0 with
             | false -> []
             | true -> match n > 9 with
                       | false -> n :: (digitsOfInt (n / 10))
                       | true -> (n mod 10) :: (digitsOfInt (n / 10)))
listReverse (match n > 0 with
             | false -> []
             | true -> match n > 9 with
                       | false -> n :: (digitsOfInt (n / 10))
                       | true -> (n mod 10) :: (digitsOfInt (n / 10)))
