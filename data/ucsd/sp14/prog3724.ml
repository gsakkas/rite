
let rec clone x n = if n <= 0 then [] else n :: ((clone x n) - 1);;
