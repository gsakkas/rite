
let rec sumList xs =
  if (Array.length xs) > 0 then (List.hd xs) + (sumList xs);;
