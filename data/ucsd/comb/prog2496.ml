
let rec listReverse l =
  let rec lr l' = function | [] -> l' | h::t -> lr (h :: l') t in
  lr [] listReverse;;
