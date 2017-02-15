
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ ((clone x n) - 1);;


(* fix

let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

*)

(* changed spans
(3,54)-(3,71)
(3,64)-(3,65)
*)

(* type error slice
(2,3)-(3,73)
(2,14)-(3,71)
(2,16)-(3,71)
(3,2)-(3,71)
(3,25)-(3,71)
(3,39)-(3,42)
(3,48)-(3,71)
(3,52)-(3,53)
(3,54)-(3,71)
(3,54)-(3,71)
(3,55)-(3,66)
(3,56)-(3,61)
*)
