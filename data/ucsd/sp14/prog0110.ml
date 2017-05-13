
let rec listReverse l =
  let rec reverseHelper r =
    match l with | [] -> [] | h::t -> listReverse t (h :: r) in
  listReverse l [];;
