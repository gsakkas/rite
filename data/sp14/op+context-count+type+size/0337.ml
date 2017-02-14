
let rec clone x n = if n <= 0 then x else clone [x] (n - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else clone x (n - 1);;

*)

(* changed spans
(2,35)-(2,36)
(2,48)-(2,51)
*)

(* type error slice
(2,3)-(2,61)
(2,14)-(2,59)
(2,42)-(2,47)
(2,42)-(2,59)
(2,48)-(2,51)
(2,48)-(2,51)
(2,49)-(2,50)
*)
