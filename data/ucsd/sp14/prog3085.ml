
let rec clone x n =
  let rec helper = match n with | 0 -> [] | _ -> (helper n) - 1 in helper n;;
