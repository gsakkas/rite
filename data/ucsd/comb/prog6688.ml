
let rec sumList xs = match 1 with | [] -> 0 | x::xs' -> x + (sumList xs');;
