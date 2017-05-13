
let rec listReverse l =
  match l with | [] -> [] | head::tail -> (listReverse tail) @ head;;

let _ = listReverse [1; 2; 3; 4];;
