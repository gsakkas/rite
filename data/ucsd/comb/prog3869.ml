
let listReverse l =
  let rec helper xs n = function | [] -> xs | hd::tl -> helper (hd :: xs) tl in
  helper [] l;;
