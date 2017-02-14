
let rec sumList xs =
  match xs with | [] -> 0 | x::[] -> x | (x::y)::[] -> x + (sumList y);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::y -> x + (sumList y);;

*)

(* changed spans
(3,2)-(3,70)
(3,37)-(3,38)
*)

(* type error slice
(3,2)-(3,70)
(3,2)-(3,70)
(3,2)-(3,70)
(3,2)-(3,70)
(3,2)-(3,70)
(3,2)-(3,70)
(3,2)-(3,70)
(3,24)-(3,25)
(3,37)-(3,38)
*)
