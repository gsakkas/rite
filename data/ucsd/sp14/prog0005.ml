
let listReverse l =
  let rec r e a = match a with | [] -> [] | x::l' -> x :: e :: (r e l') in
  r [] l;;

let _ = listReverse [1; 2; 3; 4];;
