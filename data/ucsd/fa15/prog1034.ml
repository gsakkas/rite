
let rec digitsOfInt n =
  if 0 >= n then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let _ = digitsOfInt - 222;;
