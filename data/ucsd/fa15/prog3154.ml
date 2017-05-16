
let rec clone x n = if x <= 0 then [] else x @ (clone x (n - 1));;
