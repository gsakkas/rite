
let rec clone x n = if n <= 0 then [] else x :: ((x clone x n) - 1);;
