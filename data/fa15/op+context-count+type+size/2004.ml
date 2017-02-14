
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ ((clone x n) - 1);;


(* fix

let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

*)

(* changed spans
(3,57)-(3,71)
(3,65)-(3,66)
*)

(* type error slice
(2,4)-(3,74)
(2,15)-(3,71)
(2,17)-(3,71)
(3,3)-(3,71)
(3,26)-(3,71)
(3,40)-(3,43)
(3,49)-(3,71)
(3,53)-(3,54)
(3,57)-(3,62)
(3,57)-(3,66)
(3,57)-(3,71)
(3,57)-(3,71)
*)
