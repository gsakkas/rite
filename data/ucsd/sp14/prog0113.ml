
let rec listReverse l =
  let reverseHelper r =
    match l with | [] -> l | h::t -> listReverse t (h :: r) in
  listReverse [] [];;
