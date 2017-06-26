
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
(3,24)-(3,25)
(3,37)-(3,38)
*)

(* all spans
(2,16)-(3,70)
(3,2)-(3,70)
(3,8)-(3,10)
(3,24)-(3,25)
(3,37)-(3,38)
(3,55)-(3,70)
(3,55)-(3,56)
(3,59)-(3,70)
(3,60)-(3,67)
(3,68)-(3,69)
*)
