
let rec clone x n = match n with | 0 -> [] | _ -> [clone (x, (n - 1)); x];;


(* fix

let helper (x,m) = x :: m;;

let rec clone x n = match n with | 0 -> [] | _ -> helper (x, (clone x n));;

*)

(* changed spans
(2,14)-(2,73)
(2,50)-(2,73)
(2,51)-(2,56)
(2,61)-(2,68)
(2,62)-(2,63)
(2,66)-(2,67)
(2,71)-(2,72)
*)

(* type error slice
(2,3)-(2,75)
(2,14)-(2,73)
(2,51)-(2,56)
(2,51)-(2,69)
(2,57)-(2,69)
(2,58)-(2,59)
*)
