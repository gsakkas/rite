
let rec digitsOfInt n = (n mod 10) :: ((digitsOfInt n) / 10);;
