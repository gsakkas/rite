
let rec digitsOfInt n =
  if n > 0 then let x = n mod 10 in (digitsOfInt n) :: x else [];;
