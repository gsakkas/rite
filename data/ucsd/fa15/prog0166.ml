
let rec listZeros n =
  match n with | 0 -> [] | 1 -> [0] | x -> [0] @ ((listZeros n) - 1);;
