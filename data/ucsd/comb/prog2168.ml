
let listReverse l =
  let rec reverseHelper acc =
    match acc with | [] -> acc | h::t -> reverseHelper (h :: acc) t in
  reverseHelper [] l;;
