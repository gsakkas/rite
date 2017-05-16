
let rec helper x res n = if n > 0 then [helper x res (n - 1)] @ res else [];;
