
let rec digitsOfInt n =
  match n with | [] -> 0 | n -> (n mod 10) + ((digitsOfInt n) / 10);;
