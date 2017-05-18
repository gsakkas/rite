
let rec digitsHelper n l =
  if (n mod 10) = n then [] else (digitsHelper n) / (10 ((n mod 10) :: l));;
