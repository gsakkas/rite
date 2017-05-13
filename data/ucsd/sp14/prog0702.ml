
let rec digitsOfInt n = if n <= 0 then [] else [digitsOfInt (n mod 10)];;
