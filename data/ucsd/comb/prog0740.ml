
let rec digitsOfInt n =
  if n < 0 then [] else (match n mod 10 with | _ -> [digitsOfInt (n / 10)]);;
