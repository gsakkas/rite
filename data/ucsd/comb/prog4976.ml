
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10 then n else (let d = digitsOfInt (n / 10) in (n mod 10) :: d);;
