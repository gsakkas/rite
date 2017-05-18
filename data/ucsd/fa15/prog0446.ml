
let rec sumList xs = match xs with | [] -> [] | h::xs' -> h + (sumList xs');;
