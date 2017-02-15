
let rec clone x n = if n <= 0 then [] else [x] :: (clone ((x n) - 1));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,43)-(2,46)
(2,50)-(2,69)
(2,57)-(2,68)
(2,58)-(2,63)
(2,61)-(2,62)
*)

(* type error slice
(2,3)-(2,71)
(2,14)-(2,69)
(2,50)-(2,69)
(2,51)-(2,56)
(2,57)-(2,68)
(2,58)-(2,63)
(2,59)-(2,60)
*)
