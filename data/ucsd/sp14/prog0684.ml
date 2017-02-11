
let _ =
  let rec helper xs list =
    match list with | [] -> [] | hd::tl -> helper (hd :: xs) in
  helper [] l;;
