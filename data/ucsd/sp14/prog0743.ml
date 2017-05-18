
let rec sumList xs = match xs with | [] -> 0 | x::xs -> x + (sumList xs);;

let _ = sumList [1; 3; 5; 7; 9; 11] ((1 mod 10) :: 4);;
