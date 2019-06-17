
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else x :: ((clone x n) - 1);;


(* fix

let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

*)

(* changed spans
(3,49)-(3,71)
[x] @ clone x (n - 1)
AppG [ListG [EmptyG],AppG [EmptyG,EmptyG]]

*)

(* type error slice
(2,4)-(3,73)
(2,15)-(3,71)
(2,17)-(3,71)
(3,3)-(3,71)
(3,26)-(3,71)
(3,49)-(3,71)
(3,54)-(3,71)
(3,55)-(3,66)
(3,56)-(3,61)
*)
