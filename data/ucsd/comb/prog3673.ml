
let rec sumList xs =
  if (List.length xs) != 0 then (List.nth xs 0) + (sumList (List.tl xs));;
