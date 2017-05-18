
let rec sumList (1 : int list) =
  (match 1 with | [] -> 0 | hd::tl -> hd + (sumList tl) : int);;
