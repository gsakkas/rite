
let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head (sumList tail);;

let _ = sumList [1; 2; 3; 4];;
