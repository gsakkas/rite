
let rec listReverse l = match l with | [] -> [] | h::x -> (listReverse x) @ h;;

let _ = listReverse [1; 2; 3; 4];;
