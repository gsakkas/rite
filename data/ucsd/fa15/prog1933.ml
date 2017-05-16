
let rec digitsOfInt n =
  if n > 0 then [digitsOfInt ((n - (n mod 10)) / 10); n mod 10] else [];;
