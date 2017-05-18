
let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let _ = sumList ["a"; "b"];;
