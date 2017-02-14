
let rec clone x n = if n <= 0 then [] else x :: ((x clone x n) - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else clone x (n - 1);;

*)

(* changed spans
(2,44)-(2,45)
(2,44)-(2,67)
(2,51)-(2,52)
(2,51)-(2,62)
(2,51)-(2,67)
(2,61)-(2,62)
*)

(* type error slice
(2,44)-(2,67)
(2,51)-(2,52)
(2,51)-(2,62)
(2,51)-(2,67)
(2,59)-(2,60)
*)
