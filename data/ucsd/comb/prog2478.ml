
let rec sumList xs =
  match xs with | [] -> [] | xs -> (List.hd xs) + (sumList List.tl xs);;
