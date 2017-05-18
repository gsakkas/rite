
let rec listReverse l =
  let a = [] in
  let rec get a = match a with | [] -> [] | x::xs -> [get xs; x] in get l;;
