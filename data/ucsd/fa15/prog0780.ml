
let rec sumList n xs =
  match xs with | [] -> n | h::t -> (h n) + (sumList 0 t);;

let _ = sumList [1; (-2); 3; 5];;
