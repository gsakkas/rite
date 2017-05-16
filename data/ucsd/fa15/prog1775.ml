
let rec digitsOfInt n = let x = n mod 10 in ((digitsOfInt n) / 10) @ [x];;
