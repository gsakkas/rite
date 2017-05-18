
let rec clone x n = if n <= 0 then [] else clone [x] (n - 1);;
