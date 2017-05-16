
let rec digitsOfInt n = if n > 0 then (n / 10) :: (n mod 10) else [];;
