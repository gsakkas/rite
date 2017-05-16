
let rec sumList xs = match xs with | [] -> [] | x::xs' -> x + (1 sumList xs');;
