
let rec clone x n = if n = 1 then [x] else List.append [x] ((clone x n) - 1);;


(* fix

let rec clone x n = if n = 1 then [x] else List.append [x] (clone x (n - 1));;

*)

(* changed spans
(2,62)-(2,76)
(2,70)-(2,71)
*)

(* type error slice
(2,4)-(2,79)
(2,15)-(2,76)
(2,17)-(2,76)
(2,21)-(2,76)
(2,35)-(2,38)
(2,44)-(2,55)
(2,44)-(2,76)
(2,62)-(2,67)
(2,62)-(2,71)
(2,62)-(2,76)
(2,62)-(2,76)
*)
