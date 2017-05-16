
let rec listReverse l =
  match l with | [] -> [] | t::h::[] -> h :: (listReverse t);;
