
let rec sumList xs =
  if (List.length xs) > 0 then (List.hd xs) + (sumList (List.tl xs)) else 0;;

let _ = (sumList [1; 3; 5; 7; 9; 11] 5) mod 3;;
