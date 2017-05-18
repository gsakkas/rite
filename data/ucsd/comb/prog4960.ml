
let rec clone x n = if n > 0 then x @ (clone x (n - 1)) else [];;

let _ = clone 3 5;;
