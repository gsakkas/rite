
let rec sumList xs = match xs with | [] -> [] | x::xs -> x;;

let _ = sumList [1; 2; 3; 4];;
