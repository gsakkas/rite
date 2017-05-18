
let rec listReverse l =
  let rec helper xs result =
    match xs with | [] -> result | hd::tl -> tl (hd :: result) in
  helper xs [];;
