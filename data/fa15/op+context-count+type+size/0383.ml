
let rec clone x n = if n <= 0 then [] else x :: (clone (n - 1));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,48)-(2,63)
(2,55)-(2,62)
*)

(* type error slice
(2,3)-(2,65)
(2,14)-(2,63)
(2,16)-(2,63)
(2,43)-(2,63)
(2,48)-(2,63)
(2,49)-(2,54)
*)
