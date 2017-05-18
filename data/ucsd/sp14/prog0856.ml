
let rec listReverse l =
  match l with | [] -> [] | a::b::[] -> (listReverse [b]) @ a;;

let _ = listReverse [1; 2; 3; 4];;
