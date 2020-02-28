
let rec clone x n = if n <= 0 then [] else [x] :: (clone ((x n) - 1));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,44)-(2,47)
x
VarG

(2,51)-(2,70)
clone x (n - 1)
AppG [VarG,BopG EmptyG EmptyG]

*)

(* type error slice
(2,4)-(2,72)
(2,15)-(2,70)
(2,51)-(2,70)
(2,52)-(2,57)
(2,58)-(2,69)
(2,59)-(2,64)
(2,60)-(2,61)
*)
