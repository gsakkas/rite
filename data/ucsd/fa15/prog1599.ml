
let rec listReverse l = match l with | [] -> [] | h::t -> h @ [];;

let _ = listReverse [1; 2; 3; 4];;
