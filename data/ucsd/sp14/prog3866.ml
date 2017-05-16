
let listReverse l =
  let rec helper xs = function | [] -> xs | hd::tl -> helper (hd :: xs) in
  helper [] l;;
