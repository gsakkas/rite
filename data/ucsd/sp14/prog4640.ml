
let a = [1; 2; 3];;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let _ = List.append clone 0 5 a;;
