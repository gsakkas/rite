
let rec append xs ys =
  match xs with | ys|[] -> ys | h::t -> h :: (append t ys);;
