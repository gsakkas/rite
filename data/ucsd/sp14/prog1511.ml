
let rec digitsOfInt n = [(digitsOfInt n) / 10] @ [n mod 10];;
