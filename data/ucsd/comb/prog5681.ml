
let rec digitsOfInt n =
  (if n > 10 then [n] else [digitsOfInt (n / 10)] @ [n mod 10] : int list);;
