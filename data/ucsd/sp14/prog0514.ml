
let rec sumList xs = match xs with | [] -> 0 | x::s -> x + (sumList s);;

let _ = (sumList [1; 3; 5; 7; 9; 11] 55) / 10;;
