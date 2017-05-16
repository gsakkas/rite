
let isNotPos n = n <= 0;;

let rec digitsOfInt n =
  if isNotPos n then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let _ = digitsOfInt - 10;;
