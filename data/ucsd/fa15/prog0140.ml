
let rec listReverse l =
  match l with | [] -> l | hd::tail -> (listReverse tail) :: hd;;
