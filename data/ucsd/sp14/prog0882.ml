
let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList List.tl xs);;
