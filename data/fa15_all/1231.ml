
let rec clone x n = if n <= 0 then [] else [x] :: ((clone x n) - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,44)-(2,47)
x
VarG

(2,51)-(2,68)
clone x (n - 1)
AppG [VarG,BopG EmptyG EmptyG]

*)

(* type error slice
(2,4)-(2,70)
(2,15)-(2,68)
(2,17)-(2,68)
(2,21)-(2,68)
(2,44)-(2,68)
(2,51)-(2,68)
(2,52)-(2,63)
(2,53)-(2,58)
*)
