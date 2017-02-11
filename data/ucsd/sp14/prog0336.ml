
let rec listReverse l =
  match l with | 0 -> [] | _::tl -> (listReverse tl) + tl;;
