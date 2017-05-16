
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec digitalRoot n =
  match digits n with | x::[] -> x | h::t -> h + (digitalRoot t);;
