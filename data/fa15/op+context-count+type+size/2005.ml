
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else x :: ((clone x n) - 1);;


(* fix

let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

*)

(* changed spans
(3,49)-(3,50)
(3,49)-(3,70)
(3,56)-(3,70)
(3,64)-(3,65)
*)

(* type error slice
(2,4)-(3,73)
(2,15)-(3,70)
(2,17)-(3,70)
(3,3)-(3,70)
(3,26)-(3,70)
(3,40)-(3,43)
(3,49)-(3,70)
(3,56)-(3,61)
(3,56)-(3,65)
(3,56)-(3,70)
(3,56)-(3,70)
*)
