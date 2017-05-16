
let rec clone x n =
  match n with | 1 -> [x] | n' -> List.append clone x (n - 1) [];;
