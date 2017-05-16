
let rec clone x n =
  let rec helper acc n' =
    if n <= 0 then [] else helper ((x :: acc), (n' - 1)) in
  helper [x] (n - 1);;
