
let rec listReverseHelper l =
  match l with | [] -> l | h::t -> listReverseHelper (h :: l) t;;
