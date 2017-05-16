
let rec digitsOfInt n =
  match n with | 0 -> [] | _ -> ((digitsOfInt n) / 10) @ [n % 10];;
