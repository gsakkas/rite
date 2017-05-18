
let listReverse l =
  let rec rev x l = function | [] -> x | h::t -> rev (h :: x) t in rev [] l;;
