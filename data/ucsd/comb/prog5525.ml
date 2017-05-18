
let rec digitsOfInt n =
  if n <= 0 then [] else n mod (10 append digitsOfInt (n / 10));;
