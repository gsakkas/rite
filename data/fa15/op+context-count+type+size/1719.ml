
let rec clone x n = if n > 1 then x @ (clone x (n - 1));;


(* fix

let rec clone x n = x :: (clone x (n - 1));;

*)

(* changed spans
(2,20)-(2,55)
(2,23)-(2,24)
(2,23)-(2,28)
(2,27)-(2,28)
(2,34)-(2,55)
(2,36)-(2,37)
*)

(* type error slice
(2,20)-(2,55)
(2,20)-(2,55)
(2,20)-(2,55)
(2,34)-(2,55)
(2,36)-(2,37)
*)
