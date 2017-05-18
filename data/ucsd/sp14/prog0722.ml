
let rec digitsOfInt n =
  match n with | 0 -> [] | _ -> [digitsOfInt (n / 10); n mod 10];;
