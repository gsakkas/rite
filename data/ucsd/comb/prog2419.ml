
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let digitsOfInt n =
  let rec digits o a =
    if a > 0 then digitsOfInt ((a mod 10) :: o) (a / 10) else [] in
  digits [] n;;
