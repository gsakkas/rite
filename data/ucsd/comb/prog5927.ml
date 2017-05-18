
let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n_ -> (digitsOfInt (n / 10)) :: (n_ mod 10));;
