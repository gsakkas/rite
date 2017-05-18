
let rec listReverse l =
  (match l with | [] -> [] | h::t -> (listReverse t) @ h : int list);;

let _ = listReverse [1; 2; 3; 4];;
