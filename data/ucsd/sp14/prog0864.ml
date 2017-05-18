
let rec digitsOfInt n =
  if n < 0
  then []
  else if n > 10 then [digitsOfInt (n / 10); n mod 10] else n;;
