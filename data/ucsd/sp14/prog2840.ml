
let rec clone x n =
  let rec clone_TR acc n =
    if n <= 0 then acc else clone_TR (x :: acc) (n - 1) in
  clone_TR [] n;;

let _ = clone [] [];;
