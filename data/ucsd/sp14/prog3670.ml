
let rec sumList xs =
  if (List.length xs) != 0 then (xs.(0)) + (sumList (List.hd xs));;
