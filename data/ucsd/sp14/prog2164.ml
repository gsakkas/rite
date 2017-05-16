
let rec listReverse l =
  match l with | [] -> [] | _::tl -> (listReverse tl) + tl;;
