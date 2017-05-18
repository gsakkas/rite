
let rec listReverse l =
  match l with | [] -> [] | h::tl -> (listReverse l) @ h;;

let _ = listReverse [1; 2; 3; 4];;
