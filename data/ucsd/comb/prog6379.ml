
let rec sumList xs = function | [] -> 0 | x::1 -> x + (sumList xs);;
