
let rec clone x n = if n < 1 then [] else x :: ((clone x n) - 1);;
