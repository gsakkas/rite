
let rec clone x n = if x <= 0 then [] else clone [x] (n - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else clone x (n - 1);;

*)

(* changed spans
(2,24)-(2,25)
(2,50)-(2,53)
*)

(* type error slice
(2,4)-(2,63)
(2,15)-(2,60)
(2,44)-(2,49)
(2,44)-(2,60)
(2,50)-(2,53)
(2,50)-(2,53)
(2,51)-(2,52)
*)
