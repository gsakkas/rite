
let rec digitsOfInt n =
  if n < 0
  then []
  else if (n mod 10) > 0 then [n mod 10] else [digitsOfInt (n / 10)];;
