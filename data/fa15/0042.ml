
let rec clone x n = if n <= 0 then [] else x :: (clone (n - 1));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,49)-(2,64)
clone x (n - 1)
AppG [VarG,BopG EmptyG EmptyG]

*)

(* type error slice
(2,4)-(2,66)
(2,15)-(2,64)
(2,17)-(2,64)
(2,44)-(2,64)
(2,49)-(2,64)
(2,50)-(2,55)
*)
