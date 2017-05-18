
let rec clone x n = let i = 0 in if i < n then x :: ((clone x n) - 1) else [];;
