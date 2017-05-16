
let rec digitsOfInt n =
  if n <= 0 then [] else (let n10 = n / 10 in [digitsOfInt n10; n mod 10]);;
