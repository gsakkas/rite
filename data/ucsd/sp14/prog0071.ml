
let rec listReverse n =
  match n with
  | [] -> []
  | hd::tl -> if tl = [] then n else (listReverse tl) :: hd;;
