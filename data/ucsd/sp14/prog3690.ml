
let rec listReverse l =
  if l <> [] then match l with | [] -> l | h::t -> (listReverse t) :: h;;
