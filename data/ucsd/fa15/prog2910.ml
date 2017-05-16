
let rec digitsOfIntHelper n =
  if n < 1
  then []
  else
    if n >= 10
    then [n mod 10] :: (digitsOfIntHelper (n - ((n mod 10) / 10)))
    else n;;
