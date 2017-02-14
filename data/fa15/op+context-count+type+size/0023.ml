
let rec clone x n = [clone x (n - 1); x];;


(* fix

let rec clone x n = (clone x (n - 1)) @ [x];;

*)

(* changed spans
(2,21)-(2,41)
(2,22)-(2,27)
(2,39)-(2,40)
*)

(* type error slice
(2,4)-(2,43)
(2,15)-(2,41)
(2,17)-(2,41)
(2,21)-(2,41)
(2,21)-(2,41)
(2,22)-(2,27)
(2,22)-(2,36)
*)
