
let rec digitsOfInt n =
  if n > 10 then (digitsOfInt (n / 10)) @ [n mod 10] else [n];;

let digits n = digitsOfInt (abs n);;

let _ = digits (-23422) is [(2, 3, 4, 2, 2)];;
