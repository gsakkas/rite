
let rec clone x n =
  let rec helper n = match n with | 0 -> [] | _ -> (helper n) - 1 in helper n;;
