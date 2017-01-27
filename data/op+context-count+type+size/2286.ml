
let rec sumList xs =
  match xs with | [] -> [] | head::tail -> head + (sumList tail);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

*)

(* changed spans
(3,25)-(3,27)
*)

(* type error slice
(2,4)-(3,67)
(2,17)-(3,64)
(3,3)-(3,64)
(3,9)-(3,11)
(3,25)-(3,27)
(3,44)-(3,64)
(3,52)-(3,59)
(3,52)-(3,64)
(3,60)-(3,64)
*)
