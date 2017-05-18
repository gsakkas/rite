
let rec sumList xs = function | [] -> 0 | x::xs -> x + (sumList xs);;
