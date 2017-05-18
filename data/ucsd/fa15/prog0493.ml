
let rec digitsOfInt n =
  if n != 0
  then
    (if n > 0
     then (digitsOfInt (n / 10)) @ [n mod 10]
     else digitsOfInt (n * (-1)))
  else [];;

let _ = digitsOfInt - 1229;;
