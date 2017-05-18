
let rec sumList xs = match xs with | [] -> [] | x::xs' -> x sumList xs';;
