
let rec listReverse l =
  let rec listHelper l l2 =
    match l with | [] -> l2 | h::t -> (listHelper t h) :: l2 in
  listHelper l [];;
