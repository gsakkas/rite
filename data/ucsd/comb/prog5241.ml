
let rec listReverse l =
  let newList = [] in
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> [listReverse [tail]; head];;
