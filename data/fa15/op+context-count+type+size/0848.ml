
let rec clone x n = if n = 0 then [] else (clone x n) - 1;;


(* fix

let rec clone x n = if n = 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,42)-(2,53)
(2,42)-(2,57)
(2,51)-(2,52)
*)

(* type error slice
(2,3)-(2,59)
(2,14)-(2,57)
(2,16)-(2,57)
(2,20)-(2,57)
(2,20)-(2,57)
(2,34)-(2,36)
(2,42)-(2,53)
(2,42)-(2,57)
(2,42)-(2,57)
(2,43)-(2,48)
*)
