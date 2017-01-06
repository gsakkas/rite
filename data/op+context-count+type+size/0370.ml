
let rec clone x n = if n <= 0 then x else clone [x] (n - 1);;



let rec clone x n = if n <= 0 then [] else clone x (n - 1);;


(* changed spans
(2,36)-(2,37)
(2,49)-(2,50)
(2,51)-(2,52)
*)

(* type error slice
(2,43)-(2,59)
*)
