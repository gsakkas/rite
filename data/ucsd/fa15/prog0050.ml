
let rec digitsOfInt n =
  if n < 0
  then []
  else (fun n  -> let d = digitsOfInt (n / 10) in (n mod 10) :: d);;
