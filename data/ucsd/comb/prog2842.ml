
let digitsOfInt n = match n < 0 with | true  -> [] | false  -> [(0, 1)];;

let digitsOfInt n = if n < 0 then [] else [digitsOfInt (n mod 10)];;

let digitsOfInt n =
  if n < 0 then [] else if n < 10 then [n] else digitsOfInt (n / 10);;
