
let rec listReverse l =
  match l with | [] -> [] | x::xs' -> (listReverse xs') @ x;;

let _ = listReverse [1; 2; 3; 4];;
