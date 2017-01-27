
let rec sumList xs =
  match xs with | [] -> 0 | x::[] -> x | (x::y)::[] -> x + (sumList y);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::y -> x + (sumList y);;

*)

(* changed spans
(3,3)-(3,70)
(3,38)-(3,39)
*)

(* type error slice
(2,4)-(3,73)
(2,17)-(3,70)
(3,3)-(3,70)
(3,9)-(3,11)
(3,25)-(3,26)
(3,38)-(3,39)
(3,61)-(3,68)
(3,61)-(3,70)
(3,69)-(3,70)
*)
