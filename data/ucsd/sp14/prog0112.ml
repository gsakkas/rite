
let rec listReverse l =
  let reverseHelper r =
    match l with | [] -> [] | h::t -> listReverse t (h :: r) in
  listReverse [] [];;
