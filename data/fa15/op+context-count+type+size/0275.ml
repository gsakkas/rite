
let rec clone x n = if n <= 0 then [] else (clone x n) - 1;;


(* fix

let rec clone x n = if n <= 0 then [] else clone x (n - 1);;

*)

(* changed spans
(2,45)-(2,59)
(2,53)-(2,54)
*)

(* type error slice
(2,4)-(2,61)
(2,15)-(2,59)
(2,17)-(2,59)
(2,21)-(2,59)
(2,21)-(2,59)
(2,36)-(2,38)
(2,45)-(2,50)
(2,45)-(2,54)
(2,45)-(2,59)
(2,45)-(2,59)
*)
