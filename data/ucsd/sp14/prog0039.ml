
let rec last l =
  match l with | x::[] -> x | hd::tl -> hd :: (last tl) | [] -> [];;
