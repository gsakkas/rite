
let rec listReverse l =
  match l with | [] -> [] | hd::tail -> (listReverse tail) :: hd;;
