
let rec digitsOfInt n =
  match n with | 0 -> [] | x::xs' -> ((digitsOfInt n) / 10) @ [n mod 10];;
