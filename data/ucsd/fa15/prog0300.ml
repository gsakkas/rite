
let rec listReverse l =
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> (listReverse [tail]) @ [head];;
