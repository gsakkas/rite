
let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let _ = sumList [1; 3; 5; 7; 9; 11] int_of_string 32;;
