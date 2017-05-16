
let rec listReverse l =
  let rec lr l' = match l with | [] -> l' | h::t -> lr (h :: l') t in
  lr [] listReverse;;
