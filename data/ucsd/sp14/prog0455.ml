
let rec digitsOfInt n =
  match n <= 0 with
  | false  -> ((digitsOfInt n) / 10) @ [n % 10]
  | true  -> [];;
