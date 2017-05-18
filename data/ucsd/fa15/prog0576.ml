
let rec sumList n xs = match xs with | [] -> 0 | h::t -> sumList (n + h) xs;;

let _ = sumList [1; 2; 3; 4];;
