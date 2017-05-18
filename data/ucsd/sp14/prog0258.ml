
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> tl :: (listReverse hd);;
