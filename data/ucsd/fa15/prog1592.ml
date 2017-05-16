
let rec digitsOfInt n =
  if n < 0 then [] else (let x = n mod 10 in (digitsOfInt n) :: x);;
