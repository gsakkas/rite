
let rec digitsOfInt n =
  if n > 0 then let k = digitsOfInt (n / 10) in k :: (n mod 10) else [];;
