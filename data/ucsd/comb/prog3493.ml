
let rec clone x n = if n > 0 then clone [x] (n - 1) else [];;
