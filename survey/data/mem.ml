let mem x l =
  match x with
  | []     -> false
  | hd::tl -> x = hd

let _ = mem "cat" ["dog"]
