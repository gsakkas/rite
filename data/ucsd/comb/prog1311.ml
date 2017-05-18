
let rec digitsOfInt n =
  if n <= 0 then [] else (n - ((n / 10) * 10)) :: ((digitsOfInt n) / 10);;
