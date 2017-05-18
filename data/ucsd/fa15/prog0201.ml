
let rec digitsOfInt n = [digitsOfInt n; n mod 10];;
