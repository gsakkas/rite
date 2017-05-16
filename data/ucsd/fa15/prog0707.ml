
let rec digitsOfInt n =
  let m = n in if n < 0 then [] else [[digitsOfInt (m / 10)]; n mod 10];;
