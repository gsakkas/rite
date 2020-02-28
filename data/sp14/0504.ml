
let rec clone x n = if n <= 0 then [] else n :: ((clone x n) - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else n :: (clone x (n - 1));;

*)

(* changed spans
(2,49)-(2,66)
clone x (n - 1)
AppG [VarG,BopG EmptyG EmptyG]

*)

(* type error slice
(2,4)-(2,68)
(2,15)-(2,66)
(2,17)-(2,66)
(2,21)-(2,66)
(2,44)-(2,66)
(2,49)-(2,66)
(2,50)-(2,61)
(2,51)-(2,56)
*)
