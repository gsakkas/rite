
let rec clone x n = if n = 0 then x else (let c = x :: x in clone x (n - 1));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,24)-(2,29)
(2,35)-(2,36)
(2,43)-(2,75)
(2,56)-(2,57)
*)

(* type error slice
(2,51)-(2,52)
(2,51)-(2,57)
(2,51)-(2,57)
(2,56)-(2,57)
*)
