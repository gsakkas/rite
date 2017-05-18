
let rec digitsOfIntHelper n =
  if n < 1 then [] else [digitsOfIntHelper ((n - (n mod 10)) / 10); n mod 10];;
