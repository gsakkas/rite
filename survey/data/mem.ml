let mem x l =
  match x with
  | []     -> false
  | hd::tl -> x = hd

let _ = mem 1 [1]
