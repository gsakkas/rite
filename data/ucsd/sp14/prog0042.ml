
let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let _ = (sumList [1; 3; 5; 7; 9; 11] 5) mod 5;;
