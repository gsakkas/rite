
let rec digitsOfInt n = (n mod 10) :: (if n <> [] then digitsOfInt (n / 10));;
