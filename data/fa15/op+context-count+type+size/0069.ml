
let rec clone x n = if n <= 0 then [] else [x] :: (clone ((x n) - 1));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,44)-(2,47)
(2,52)-(2,68)
(2,60)-(2,63)
(2,60)-(2,68)
(2,62)-(2,63)
*)

(* type error slice
(2,4)-(2,72)
(2,15)-(2,68)
(2,52)-(2,57)
(2,52)-(2,68)
(2,60)-(2,61)
(2,60)-(2,63)
(2,60)-(2,68)
*)
