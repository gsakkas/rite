
let rec digitsOfInt n = (n mod 10) :: (if n > 0 then digitsOfInt (n / 10));;
