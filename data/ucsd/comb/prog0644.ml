
let rec clone x n =
  let rec clone_RT acc n = if n <= 0 then acc else clone (x :: acc) (n - 1) in
  clone_RT [] n;;
