
let rec listReverse l =
  match l with | x::[] -> x | hd::tl -> (listReverse tl) :: hd;;
