
let rec digitsOfInt n =
  (if n < 10 then [n] else [n % 10] :: ((digitsOfInt n) / 10) : int list);;
