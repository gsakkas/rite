
let rec clone x n =
  let helper = match n with | 0 -> [] | _ -> x :: (clone x (n - 1)) in
  helper n;;
