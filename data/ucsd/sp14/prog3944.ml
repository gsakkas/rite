
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let y = ((clone List.hd l1 ((List.length l1) - (List.length l2)) y), l2);;
