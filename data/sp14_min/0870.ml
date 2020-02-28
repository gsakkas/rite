
let rec sumList xs =
  match xs with | [] -> [] | xs -> (List.hd xs) + (sumList List.tl xs);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(3,25)-(3,27)
0
LitG

(3,51)-(3,71)
sumList (List.tl xs)
AppG [AppG [EmptyG]]

*)

(* type error slice
(2,4)-(3,73)
(2,17)-(3,71)
(3,3)-(3,71)
(3,9)-(3,11)
(3,25)-(3,27)
(3,36)-(3,71)
(3,51)-(3,71)
(3,52)-(3,59)
(3,60)-(3,67)
*)
