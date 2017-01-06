
let rec clone x n = if n <= 0 then [] else clone [x] (n - 1);;



let rec clone x n = if n <= 0 then [] else clone x (n - 1);;


(* changed spans
(2,50)-(2,51)
(2,52)-(2,53)
*)

(* type error slice
(2,44)-(2,60)
*)
