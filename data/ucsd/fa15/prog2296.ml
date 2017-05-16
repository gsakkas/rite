
let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t :: (listReverse [h]);;
