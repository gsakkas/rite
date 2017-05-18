
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let _ = clone 3 5.5;;
