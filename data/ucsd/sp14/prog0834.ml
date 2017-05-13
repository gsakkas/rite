
let listReverse l =
  let rec rev x = match l with | [] -> x | h::t -> rev (h :: x) t in rev [] l;;
