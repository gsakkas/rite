
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let _ = [(1, 0)] @ (clone 0 1);;
