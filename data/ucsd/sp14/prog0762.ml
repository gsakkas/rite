
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec digits n = digitsOfInt (abs n) digits (-124074);;
