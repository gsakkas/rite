
let rec sumList xs =
  match xs with | [] -> 0 | f::b -> f + (sumList (List.tl xs));;

let li = sumList [1; 2; 3; 4];;

let _ = match li with | f::b -> b;;
