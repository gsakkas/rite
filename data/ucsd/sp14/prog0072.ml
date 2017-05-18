
let rec listReverse n =
  match n with | [] -> [] | hd::tl -> (listReverse tl) @ hd;;

let _ = listReverse [1; 2; 3; 4];;
