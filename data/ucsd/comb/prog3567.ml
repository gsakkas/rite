
let rec digitsOfInt n =
  if n <= 0
  then []
  else (let digits = digitsOfInt (n / 10) in digits @ (n mod 10));;
