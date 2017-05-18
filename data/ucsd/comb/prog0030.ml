
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> listReverse (hd :: l) tl;;
