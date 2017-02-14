
let rec clone x n = if x <= 0 then [] else [clone x];;


(* fix

let rec clone x n = if n <= 0 then [] else clone x (n - 1);;

*)

(* changed spans
(2,23)-(2,24)
(2,43)-(2,52)
(2,44)-(2,51)
*)

(* type error slice
(2,3)-(2,54)
(2,14)-(2,52)
(2,16)-(2,52)
(2,20)-(2,52)
(2,43)-(2,52)
(2,43)-(2,52)
(2,44)-(2,49)
(2,44)-(2,51)
*)
