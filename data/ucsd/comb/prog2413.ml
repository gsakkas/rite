
let rec listReverse l =
  match l with | [] -> [] | x::l' -> [listReverse l'; x];;
