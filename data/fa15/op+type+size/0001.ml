
let rec clone x n = if n = 1 then [] @ x else (clone x) :: (([x] n) - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,23)-(2,28)
(2,27)-(2,28)
(2,34)-(2,40)
(2,37)-(2,38)
(2,39)-(2,40)
(2,46)-(2,55)
(2,47)-(2,52)
(2,60)-(2,67)
*)

(* type error slice
(2,3)-(2,74)
(2,14)-(2,72)
(2,16)-(2,72)
(2,20)-(2,72)
(2,46)-(2,55)
(2,46)-(2,72)
(2,46)-(2,72)
(2,46)-(2,72)
(2,47)-(2,52)
(2,59)-(2,72)
(2,60)-(2,67)
(2,61)-(2,64)
*)

(* all spans
(2,14)-(2,72)
(2,16)-(2,72)
(2,20)-(2,72)
(2,23)-(2,28)
(2,23)-(2,24)
(2,27)-(2,28)
(2,34)-(2,40)
(2,37)-(2,38)
(2,34)-(2,36)
(2,39)-(2,40)
(2,46)-(2,72)
(2,46)-(2,55)
(2,47)-(2,52)
(2,53)-(2,54)
(2,59)-(2,72)
(2,60)-(2,67)
(2,61)-(2,64)
(2,62)-(2,63)
(2,65)-(2,66)
(2,70)-(2,71)
*)
