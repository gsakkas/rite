
let rec clone x n = if n > 1 then x @ (clone x (n - 1));;
