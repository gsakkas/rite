
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

(* all spans
(2,14)-(2,76)
(2,16)-(2,76)
(2,20)-(2,76)
(2,23)-(2,28)
(2,23)-(2,24)
(2,27)-(2,28)
(2,34)-(2,35)
(2,41)-(2,76)
(2,50)-(2,56)
(2,50)-(2,51)
(2,55)-(2,56)
(2,60)-(2,75)
(2,60)-(2,65)
(2,66)-(2,67)
(2,68)-(2,75)
(2,69)-(2,70)
(2,73)-(2,74)
*)