
let rec last l = match l with | x::[] -> x | hd::tl -> last tl | [] -> [];;

let _ = last [1; 2; 3; 4];;
