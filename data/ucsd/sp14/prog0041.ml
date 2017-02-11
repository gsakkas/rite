
let rec listReverse l =
  match l with | [] -> 0 | hd::tl -> (listReverse tl) :: hd;;
