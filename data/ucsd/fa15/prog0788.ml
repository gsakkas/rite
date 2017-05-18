
let rec sumList n xs =
  match xs with | [] -> 0 | h::t -> (h n) + (sumList t xs);;
