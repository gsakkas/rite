
let rec clone x n = if n <= 0 then [] else x :: (clone (n - 1));;
