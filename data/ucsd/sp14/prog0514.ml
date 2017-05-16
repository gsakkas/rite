
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt div (n, 10)) @ [n];;
