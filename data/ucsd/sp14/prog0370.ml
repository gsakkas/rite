
let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

let _ = sumList [1; 3; 5; 7; 9; 11] List.hd 55;;
