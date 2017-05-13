
let rec digitsOfInt n =
  if n < 1 then [] else (digitsOfInt (n / 10)) :: (n mod 10);;
