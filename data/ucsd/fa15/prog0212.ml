
let rec listReverse l =
  match l with | [] -> [] | h::tl -> (listReverse tl) @ h;;

let _ = listReverse [1; 2; 3; 4];;
