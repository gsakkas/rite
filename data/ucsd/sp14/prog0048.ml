
let listReverse l =
  let rec rev x = match x with | [] -> x | h::t -> rev (h :: x) t in rev [] l;;
