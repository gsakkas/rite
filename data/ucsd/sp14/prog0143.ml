
let listReverse l =
  let rec helper xs =
    match xs with | [] -> [] | hd::tl -> helper (hd :: xs) tl in
  helper [] l;;
