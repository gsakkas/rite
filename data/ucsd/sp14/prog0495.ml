
let rec digitsOfInt n =
  if n < 0
  then []
  else (let a = n / 10 in let b = n mod 10 in (digitsOfInt a) :: b);;
