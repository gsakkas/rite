
let rec digitsOfIntHelper n =
  if n < 1
  then []
  else if n >= 10 then [digitsOfIntHelper (n / 10); n mod 10] else [n];;
