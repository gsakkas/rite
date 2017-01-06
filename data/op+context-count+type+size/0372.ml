
let rec clone x n = if x <= 0 then [] else [clone x];;



let rec clone x n = if n <= 0 then [] else clone x (n - 1);;


(* changed spans
(2,24)-(2,25)
(2,44)-(2,45)
(2,52)-(2,53)
*)

(* type error slice
(2,45)-(2,52)
*)
