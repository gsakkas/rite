
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> [(digitsOfInt n) / 10] @ [n % 10];;
