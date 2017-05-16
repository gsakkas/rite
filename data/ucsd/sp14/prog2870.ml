
let rec listReverse l = match l with | [] -> [] | h::t -> h @ (listReverse t);;

let _ = listReverse [1; 2; 3; 4];;
