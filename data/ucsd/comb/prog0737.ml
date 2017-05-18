
let rec sumList xs =
  match xs with | [] -> 0 | x::xs -> (List.fold_left x) + xs;;
