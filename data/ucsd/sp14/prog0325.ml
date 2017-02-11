
let _ =
  let rec digitsOfInt n = if n < 0 then 1 else digitsOfInt (n mod 10) in
  digitsOfInt [] n;;
