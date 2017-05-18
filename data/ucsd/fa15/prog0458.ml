
let rec listReverse l =
  match l with | x::[] -> x | x::y -> (listReverse y) @ x;;

let _ = listReverse [1; 2; 3; 4];;
