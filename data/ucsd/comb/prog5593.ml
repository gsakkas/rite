
let rec digitsOfInt n =
  if n > 0 then [digitsOfInt (n / 10); m mod 10] else [];;
