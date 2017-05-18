
let rec sumList xs =
  match xs with | [] -> 0 | f::b -> f + (sumList List.tl xs);;
