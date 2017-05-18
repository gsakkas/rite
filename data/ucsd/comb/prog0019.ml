
let rec listReverse l =
  match l with
  | [] -> []
  | hd::tl -> if hd != [] then (listReverse tl) :: hd else hd;;
