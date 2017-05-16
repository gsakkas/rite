
let listReverse l =
  let rec r e a = match a with | [] -> [] | x::l' -> (r e l') :: x :: e in
  r [] l;;
