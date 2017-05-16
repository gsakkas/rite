
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | _ -> (digitsOfInt (n / 10)) :: (n mod 10));;
