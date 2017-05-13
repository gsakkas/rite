
let rec listReverse n =
  match n with | hd::tl -> if tl = [] then tl :: hd else listReverse tl;;
