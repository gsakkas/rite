
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n = 0 then [0] else if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10];;
