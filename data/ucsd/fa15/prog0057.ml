
let rec listReverse l =
  match l with | [] -> [] | h::t -> let r = listReverse t in r @ h;;

let _ = listReverse [1; 2; 3; 4];;
