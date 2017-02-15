
let rec clone x n = if n = 0 then x else (let c = x :: x in clone x (n - 1));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,23)-(2,28)
(2,34)-(2,35)
(2,41)-(2,76)
(2,55)-(2,56)
*)

(* type error slice
(2,50)-(2,51)
(2,50)-(2,56)
(2,50)-(2,56)
(2,55)-(2,56)
*)
