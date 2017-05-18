
let rec listReverse l =
  match l with | [] -> [l] | h::t -> h :: (listReverse t);;
