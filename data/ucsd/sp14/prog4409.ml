
let rec clone x n = let i = 0 in if i < n then [(clone x n) - 1; x] else [];;
