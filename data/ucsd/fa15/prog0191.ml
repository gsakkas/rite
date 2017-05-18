
let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 1] append digitsOfInt (n / 10);;
