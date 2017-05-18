
let rec sumList xs =
  if xs = [] then 0 else (List.hd xs) + (sumList List.tl xs);;
