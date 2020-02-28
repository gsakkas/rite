
let rec sumList xs =
  match xs with | [] -> [] | head::tail -> head + (sumList tail);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

*)

(* changed spans
(3,25)-(3,27)
0
LitG

*)

(* type error slice
(2,4)-(3,67)
(2,17)-(3,65)
(3,3)-(3,65)
(3,25)-(3,27)
(3,44)-(3,65)
(3,51)-(3,65)
(3,52)-(3,59)
*)
