
let rec sumList xs =
  match xs with | [] -> 0 | x::xs -> (List.fold_left x) + xs;;



let rec sumList xs = match xs with | [] -> 0;;


(* changed spans
(3,27)-(3,61)
*)

(* type error slice
(3,39)-(3,55)
*)
