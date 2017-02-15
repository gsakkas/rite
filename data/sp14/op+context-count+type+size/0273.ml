
let rec sumList xs =
  match xs with | [] -> 0 | x::xs -> (List.fold_left x) + xs;;


(* fix

let rec sumList xs = match xs with | [] -> 0;;

*)

(* changed spans
(3,2)-(3,60)
(3,37)-(3,60)
*)

(* type error slice
(3,37)-(3,55)
(3,37)-(3,60)
(3,38)-(3,52)
*)
