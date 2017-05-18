
let rec digitsOfInt n =
  if n > 0 then ((digitsOfInt n) mod 10) :: (n / 10) else [];;
