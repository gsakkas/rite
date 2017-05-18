
let rec listReverse l = match l with | [] -> [] | h::t -> (listReverse t) @ h;;

let _ = listReverse [1; 2; 3; 5];;
