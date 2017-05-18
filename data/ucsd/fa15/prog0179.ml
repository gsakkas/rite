
let rec digitsOfInt n =
  let m = n in if n < 0 then [] else [digitsOfInt (n / 10); m mod 10];;
