
let rec clone x n = if n <= 0 then [] else x :: (clone (x, (n - 1)));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,49)-(2,69)
clone x (n - 1)
AppG [VarG,BopG EmptyG EmptyG]

*)

(* type error slice
(2,4)-(2,71)
(2,15)-(2,69)
(2,49)-(2,69)
(2,50)-(2,55)
(2,56)-(2,68)
(2,57)-(2,58)
*)
