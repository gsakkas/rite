
let rec help n = if n > 0 then (n mod 10) + (help (n / 10)) else 0;;

let rec digitsOfInt n =
  if n >= 10 then (n / (help n 1)) :: (digitsOfInt (n / 10)) else [n];;
