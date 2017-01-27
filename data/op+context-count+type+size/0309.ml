
let rec sumList xs =
  match xs with | [] -> 0 | x::xs -> (List.fold_left x) + xs;;


(* fix

let rec sumList xs = match xs with | [] -> 0;;

*)

(* changed spans
(3,3)-(3,61)
(3,39)-(3,61)
*)

(* type error slice
(3,3)-(3,61)
(3,39)-(3,53)
(3,39)-(3,55)
(3,39)-(3,61)
(3,54)-(3,55)
(3,59)-(3,61)
*)
