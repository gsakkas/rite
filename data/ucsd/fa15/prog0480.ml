
let rec digitsOfInt n =
  let x = n mod 10 in if n > 9 then (digitsOfInt (n / 10)) :: x else n;;
