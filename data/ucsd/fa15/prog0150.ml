
let rec digitsOfIntHelper n =
  if n < 1 then [] else [n mod 10] :: (digitsOfIntHelper [(n mod 10) / 10]);;
