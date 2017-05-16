
let rec digitsOfInt n = if n > 0 then (n + (digitsOfInt n)) - 1;;
