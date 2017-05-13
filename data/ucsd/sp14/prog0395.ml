
let rec listReverse l =
  match l with | [] -> l | h::t -> [List.hd (listReverse t); h];;

let _ = listReverse [1; 0; 1] List.hd [];;
