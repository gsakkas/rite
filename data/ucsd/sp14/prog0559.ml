
let rec digitsOfInt n =
  if n <= 0
  then []
  else (let digit = digitsOfInt (n / 10) in digit @ [n mod 10]);;

let digits n = digitsOfInt (abs n);;

let _ = digits - 23422;;
