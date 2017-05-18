
let rec digitsOfInt n = if n > 0 then (digitsOfInt (n / 10)) @ [];;
