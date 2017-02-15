
let rec clone x n = if n <= 0 then [] else (clone x n) - 1;;


(* fix

let rec clone x n = if n <= 0 then [] else clone x (n - 1);;

*)

(* changed spans
(2,43)-(2,58)
(2,52)-(2,53)
*)

(* type error slice
(2,3)-(2,60)
(2,14)-(2,58)
(2,16)-(2,58)
(2,20)-(2,58)
(2,20)-(2,58)
(2,35)-(2,37)
(2,43)-(2,54)
(2,43)-(2,58)
(2,43)-(2,58)
(2,44)-(2,49)
*)
